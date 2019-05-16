Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 409EC20977
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2019 16:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbfEPOYL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 May 2019 10:24:11 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46539 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfEPOYK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 May 2019 10:24:10 -0400
Received: by mail-pg1-f194.google.com with SMTP id t187so1631509pgb.13;
        Thu, 16 May 2019 07:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=pbiGxWp+6g8Ev1vPyMkDL0Yj0MpKYGjwYXWdffQT+X0=;
        b=Zq2F9+AwPqYiGFsLYwXUsUayVj+DYRUxovrZuhCckbgt3neqkzA5476vz9QvYBHHJ9
         cmBQz7WpTNxXNfR5CBKLXJWTAvNkz75kzjVLSmEdvZsvVhZ7sFx8yWe38gkPLUWHePBn
         GvcqF64fgZlxB4aghH6KrBWjGYU3uVtC1GrCZiP6PN2yy8oHLd2q6QRv246u9E7NWaBJ
         pRQc1mbYjkIg9q5RmbQnKu/4kIch6ECX8TIAygzBIlCPZaR+gTt/BWhh+v/+b9QY0c2t
         1G/45BQW3mPbhNbyIWPdHVK5gWtu3+8oH9kYiipg0+6XSj6aTxaFvfH5RKceG83dgStC
         +agQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pbiGxWp+6g8Ev1vPyMkDL0Yj0MpKYGjwYXWdffQT+X0=;
        b=kZ4vXEeoyb5PHqPHn9AUZodxD54LScLbIU0t+GsW94onq2JHCShteK854XR6mxjP1y
         d4Sx9/6DYCSaxdJO2+A8IX+06yFSxVAoAtK9gMqjMQ+Z8tr238c/HobC2MKYDml2LDeP
         Ca7tAycWLpB2ruofBJyY6Fm3ASBeYSBmmJ5ByKrsAUo6YE+oUfDkxdufKGxal9kVEn7j
         vBdjElDElKrMFi6G2EYRremFE0R3lIRHQaHGhy/LfvTAMhTPqPI1ngGOOeOW87NRnr88
         ycfHoSpq0pIyVcIuRPvg7/wCxjqrPvbE+Ipl3zGQYx+sOp2VJW7koq4lNWLv0xqQZC2y
         8Ovg==
X-Gm-Message-State: APjAAAXIIZOysWZpKkq8zd5+HqVSQV7fCgv/aeBfWDxi0AgJ4+zNEbnN
        wHb5g9W3O356IL8CNC6evHc=
X-Google-Smtp-Source: APXvYqzqUF7sYORxVtp1XKW8qb53iivcDATFMHlhkdQMRgw2+5O3yikymYytMK/4RZBJPrz8IT/DfA==
X-Received: by 2002:a65:5241:: with SMTP id q1mr49877661pgp.298.1558016649724;
        Thu, 16 May 2019 07:24:09 -0700 (PDT)
Received: from ubuntu.localdomain ([104.238.150.158])
        by smtp.gmail.com with ESMTPSA id u6sm7080284pfm.10.2019.05.16.07.24.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 07:24:09 -0700 (PDT)
From:   Muchun Song <smuchun@gmail.com>
To:     gregkh@linuxfoundation.org, rafael@kernel.org,
        benh@kernel.crashing.org, prsood@codeaurora.org,
        mojha@codeaurora.org, gkohli@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        zhaowuyun@wingtech.com
Subject: [PATCH v4] driver core: Fix use-after-free and double free on glue directory
Date:   Thu, 16 May 2019 22:23:42 +0800
Message-Id: <20190516142342.28019-1-smuchun@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is a race condition between removing glue directory and adding a new
device under the glue directory. It can be reproduced in following test:

path 1: Add the child device under glue dir
device_add()
    get_device_parent()
        mutex_lock(&gdp_mutex);
        ....
        /*find parent from glue_dirs.list*/
        list_for_each_entry(k, &dev->class->p->glue_dirs.list, entry)
            if (k->parent == parent_kobj) {
                kobj = kobject_get(k);
                break;
            }
        ....
        mutex_unlock(&gdp_mutex);
        ....
    ....
    kobject_add()
        kobject_add_internal()
            create_dir()
                sysfs_create_dir_ns()
                    if (kobj->parent)
                        parent = kobj->parent->sd;
                    ....
                    kernfs_create_dir_ns(parent)
                        kernfs_new_node()
                            kernfs_get(parent)
                        ....
                        /* link in */
                        rc = kernfs_add_one(kn);
                        if (!rc)
                            return kn;

                        kernfs_put(kn)
                            ....
                            repeat:
                            kmem_cache_free(kn)
                            kn = parent;

                            if (kn) {
                                if (atomic_dec_and_test(&kn->count))
                                    goto repeat;
                            }
                        ....

path2: Remove last child device under glue dir
device_del()
    cleanup_device_parent()
        cleanup_glue_dir()
            mutex_lock(&gdp_mutex);
            if (!kobject_has_children(glue_dir))
                kobject_del(glue_dir);
            kobject_put(glue_dir);
            mutex_unlock(&gdp_mutex);

Before path2 remove last child device under glue dir, If path1 add a new
device under glue dir, the glue_dir kobject reference count will be
increase to 2 via kobject_get(k) in get_device_parent(). And path1 has
been called kernfs_new_node(), but not call kernfs_get(parent).
Meanwhile, path2 call kobject_del(glue_dir) beacause 0 is returned by
kobject_has_children(). This result in glue_dir->sd is freed and it's
reference count will be 0. Then path1 call kernfs_get(parent) will trigger
a warning in kernfs_get()(WARN_ON(!atomic_read(&kn->count))) and increase
it's reference count to 1. Because glue_dir->sd is freed by path2, the next
call kernfs_add_one() by path1 will fail(This is also use-after-free)
and call atomic_dec_and_test() to decrease reference count. Because the
reference count is decremented to 0, it will also call kmem_cache_free()
to free glue_dir->sd again. This will result in double free.

In order to avoid this happening, we can ensure the lookup of the glue
dir and creation of the child object(s) are done under a single instance
of gdp_mutex so we never see a stale "empty" but still poentially used
glue dir around.

The following calltrace is captured in kernel 4.14 with the following patch
applied:

commit 726e41097920 ("drivers: core: Remove glue dirs from sysfs earlier")

--------------------------------------------------------------------------
[    3.633703] WARNING: CPU: 4 PID: 513 at .../fs/kernfs/dir.c:494
                Here is WARN_ON(!atomic_read(&kn->count) in kernfs_get().
....
[    3.633986] Call trace:
[    3.633991]  kernfs_create_dir_ns+0xa8/0xb0
[    3.633994]  sysfs_create_dir_ns+0x54/0xe8
[    3.634001]  kobject_add_internal+0x22c/0x3f0
[    3.634005]  kobject_add+0xe4/0x118
[    3.634011]  device_add+0x200/0x870
[    3.634017]  _request_firmware+0x958/0xc38
[    3.634020]  request_firmware_into_buf+0x4c/0x70
....
[    3.634064] kernel BUG at .../mm/slub.c:294!
                Here is BUG_ON(object == fp) in set_freepointer().
....
[    3.634346] Call trace:
[    3.634351]  kmem_cache_free+0x504/0x6b8
[    3.634355]  kernfs_put+0x14c/0x1d8
[    3.634359]  kernfs_create_dir_ns+0x88/0xb0
[    3.634362]  sysfs_create_dir_ns+0x54/0xe8
[    3.634366]  kobject_add_internal+0x22c/0x3f0
[    3.634370]  kobject_add+0xe4/0x118
[    3.634374]  device_add+0x200/0x870
[    3.634378]  _request_firmware+0x958/0xc38
[    3.634381]  request_firmware_into_buf+0x4c/0x70
--------------------------------------------------------------------------

Fixes: 726e41097920 ("drivers: core: Remove glue dirs from sysfs earlier")

Signed-off-by: Muchun Song <smuchun@gmail.com>
---

Change in v4:
       1. Add some kerneldoc comment.
       2. Remove unlock_if_glue_dir().
       3. Rename get_device_parent_locked_if_glue_dir() to
          get_device_parent_locked.
       4. Update commit message.
Change in v3:
       Add change log.
Change in v2:
       Fix device_move() also.

 drivers/base/core.c | 108 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 92 insertions(+), 16 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4aeaa0c92bda..2251e391a352 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1739,8 +1739,23 @@ class_dir_create_and_add(struct class *class, struct kobject *parent_kobj)
 
 static DEFINE_MUTEX(gdp_mutex);
 
-static struct kobject *get_device_parent(struct device *dev,
-					 struct device *parent)
+/**
+ * __get_device_parent() - Get the parent device kobject.
+ * @dev: Pointer to the device structure.
+ * @parent: Pointer to the parent device structure.
+ * @lock: When we live in a glue directory, should we hold the
+ *        gdp_mutex lock when this function returns? If @lock
+ *        is true, this function returns with the gdp_mutex
+ *        holed. Otherwise it will not.
+ *
+ * Note: Only when we live in a glue directory and @lock is
+ * true, the function will return with the gdp_mutex holed.
+ * In this case, The caller is responsible for releasing the
+ * gdp_mutex lock.
+ */
+static struct kobject *__get_device_parent(struct device *dev,
+					   struct device *parent,
+					   bool lock)
 {
 	if (dev->class) {
 		struct kobject *kobj = NULL;
@@ -1778,16 +1793,32 @@ static struct kobject *get_device_parent(struct device *dev,
 				break;
 			}
 		spin_unlock(&dev->class->p->glue_dirs.list_lock);
-		if (kobj) {
-			mutex_unlock(&gdp_mutex);
-			return kobj;
-		}
 
-		/* or create a new class-directory at the parent device */
-		k = class_dir_create_and_add(dev->class, parent_kobj);
-		/* do not emit an uevent for this simple "glue" directory */
-		mutex_unlock(&gdp_mutex);
-		return k;
+		/**
+		 * If not found, create a new class-directory at the
+		 * parent device and do not emit an uevent for this
+		 * simple "glue" directory.
+		 */
+		if (!kobj)
+			kobj = class_dir_create_and_add(dev->class,
+							parent_kobj);
+
+		/**
+		 * If the caller want to add/move a new directory
+		 * under the glue directory next. We should leave
+		 * the function with the gdp_mutex holed. And then
+		 * release the gdp_mutex lock after adding/moving
+		 * the new directory.
+		 *
+		 * Because we should ensure the lookup of the glue
+		 * dir and creation of the child object(s) are done
+		 * under a single instance of gdp_mutex so we never
+		 * see a stale "empty" but still poentially used
+		 * glue dir around.
+		 */
+		if (!lock)
+			mutex_unlock(&gdp_mutex);
+		return kobj;
 	}
 
 	/* subsystems can specify a default root directory for their devices */
@@ -1799,6 +1830,36 @@ static struct kobject *get_device_parent(struct device *dev,
 	return NULL;
 }
 
+static inline struct kobject *get_device_parent(struct device *dev,
+						struct device *parent)
+{
+	return __get_device_parent(dev, parent, false);
+}
+
+/**
+ * Note: When this function returns successfully, the gdp_mutex
+ * lock may be held (when we live in a glue directory). The caller
+ * can determine wheather we hold the lock by live_in_glue_dir().
+ *
+ * If true is returned by live_in_glue_dir(), the caller should
+ * drop the gdp_mutex lock.
+ */
+static inline struct kobject *get_device_parent_locked(struct device *dev,
+						       struct device *parent)
+{
+	struct kobject *kobj = __get_device_parent(dev, parent, true);
+
+	/**
+	 * When we create a new glue directory fail, there
+	 * is no need for us to leave the function with the
+	 * the gdp_mutex holed.
+	 */
+	if (IS_ERR(kobj))
+		mutex_unlock(&gdp_mutex);
+
+	return kobj;
+}
+
 static inline bool live_in_glue_dir(struct kobject *kobj,
 				    struct device *dev)
 {
@@ -2040,7 +2101,7 @@ int device_add(struct device *dev)
 	pr_debug("device: '%s': %s\n", dev_name(dev), __func__);
 
 	parent = get_device(dev->parent);
-	kobj = get_device_parent(dev, parent);
+	kobj = get_device_parent_locked(dev, parent);
 	if (IS_ERR(kobj)) {
 		error = PTR_ERR(kobj);
 		goto parent_error;
@@ -2055,10 +2116,17 @@ int device_add(struct device *dev)
 	/* first, register with generic layer. */
 	/* we require the name to be set before, and pass NULL */
 	error = kobject_add(&dev->kobj, dev->kobj.parent, NULL);
-	if (error) {
-		glue_dir = get_glue_dir(dev);
+
+	glue_dir = get_glue_dir(dev);
+	/**
+	 * Drops the mutex possibly acquired by get_device_parent_locked().
+	 * See the comment in __get_device_parent().
+	 */
+	if (live_in_glue_dir(glue_dir, dev))
+		mutex_unlock(&gdp_mutex);
+
+	if (error)
 		goto Error;
-	}
 
 	/* notify platform of device entry */
 	error = device_platform_notify(dev, KOBJ_ADD);
@@ -2972,7 +3040,7 @@ int device_move(struct device *dev, struct device *new_parent,
 
 	device_pm_lock();
 	new_parent = get_device(new_parent);
-	new_parent_kobj = get_device_parent(dev, new_parent);
+	new_parent_kobj = get_device_parent_locked(dev, new_parent);
 	if (IS_ERR(new_parent_kobj)) {
 		error = PTR_ERR(new_parent_kobj);
 		put_device(new_parent);
@@ -2982,6 +3050,14 @@ int device_move(struct device *dev, struct device *new_parent,
 	pr_debug("device: '%s': %s: moving to '%s'\n", dev_name(dev),
 		 __func__, new_parent ? dev_name(new_parent) : "<NULL>");
 	error = kobject_move(&dev->kobj, new_parent_kobj);
+
+	/**
+	 * Drops the mutex possibly acquired by get_device_parent_locked().
+	 * See the comment in __get_device_parent().
+	 */
+	if (live_in_glue_dir(new_parent_kobj, dev))
+		mutex_unlock(&gdp_mutex);
+
 	if (error) {
 		cleanup_glue_dir(dev, new_parent_kobj);
 		put_device(new_parent);
-- 
2.17.1

