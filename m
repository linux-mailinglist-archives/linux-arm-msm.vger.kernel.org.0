Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4AAB1884D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 14:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgCQNLA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 09:11:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:37814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbgCQNK6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 09:10:58 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A04152077A;
        Tue, 17 Mar 2020 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584450657;
        bh=iCrjWBQmeN1BbqeAvSke6TEyonsZ7DG7ruorIpYEhOM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u5B+6Ay0mn2w5069gpiEsLEXrtPLHqQWMO+jWZnS89xwAni20PldmmkHNiWsHU/Xc
         LpnLpBhX5FoHk1Fc6TEBt2IDAX2bqIsb38oDboNHrc0DZUPFjrnxSdTN5DHdu6vB6d
         /BirqAzfuCWE0oQB2LiVBpaPAc55Hs8+x3GtNbcw=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jEBzh-0006SX-Ut; Tue, 17 Mar 2020 14:10:53 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        David Sterba <dsterba@suse.com>,
        David Howells <dhowells@redhat.com>,
        "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Tyler Hicks <code@tyhicks.com>,
        Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
        Anton Altaparmakov <anton@tuxera.com>,
        Mark Fasheh <mark@fasheh.com>,
        Joel Becker <jlbec@evilplan.org>,
        Joseph Qi <joseph.qi@linux.alibaba.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-afs@lists.infradead.org,
        ecryptfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
        ocfs2-devel@oss.oracle.com
Subject: [PATCH 11/12] docs: filesystems: fix renamed references
Date:   Tue, 17 Mar 2020 14:10:50 +0100
Message-Id: <2c2f46214a09307b510ba3e1e82e52cd5326dbb2.1584450500.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1584450500.git.mchehab+huawei@kernel.org>
References: <cover.1584450500.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some filesystem references got broken by a previous patch
series I submitted. Address those.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/stable/sysfs-devices-node   |  2 +-
 Documentation/ABI/testing/procfs-smaps_rollup |  2 +-
 Documentation/admin-guide/cpu-load.rst        |  2 +-
 .../admin-guide/kernel-parameters.txt         |  2 +-
 Documentation/admin-guide/nfs/nfsroot.rst     |  2 +-
 .../driver-api/driver-model/device.rst        |  4 +-
 .../driver-api/driver-model/overview.rst      |  2 +-
 Documentation/filesystems/dax.txt             |  2 +-
 Documentation/filesystems/dnotify.txt         |  2 +-
 .../filesystems/ramfs-rootfs-initramfs.rst    |  2 +-
 Documentation/filesystems/sysfs.rst           |  2 +-
 .../powerpc/firmware-assisted-dump.rst        |  2 +-
 Documentation/process/adding-syscalls.rst     |  2 +-
 .../it_IT/process/adding-syscalls.rst         |  2 +-
 .../translations/zh_CN/filesystems/sysfs.txt  |  6 +--
 MAINTAINERS                                   | 54 +++++++++----------
 Next/merge.log                                | 12 ++---
 drivers/base/core.c                           |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  2 +-
 fs/Kconfig                                    |  2 +-
 fs/Kconfig.binfmt                             |  2 +-
 fs/adfs/Kconfig                               |  2 +-
 fs/affs/Kconfig                               |  2 +-
 fs/afs/Kconfig                                |  6 +--
 fs/bfs/Kconfig                                |  2 +-
 fs/cramfs/Kconfig                             |  2 +-
 fs/ecryptfs/Kconfig                           |  2 +-
 fs/hfs/Kconfig                                |  2 +-
 fs/hpfs/Kconfig                               |  2 +-
 fs/isofs/Kconfig                              |  2 +-
 fs/namespace.c                                |  2 +-
 fs/notify/inotify/Kconfig                     |  2 +-
 fs/ntfs/Kconfig                               |  2 +-
 fs/ocfs2/Kconfig                              |  2 +-
 fs/proc/Kconfig                               |  4 +-
 fs/romfs/Kconfig                              |  2 +-
 fs/sysfs/dir.c                                |  2 +-
 fs/sysfs/file.c                               |  2 +-
 fs/sysfs/mount.c                              |  2 +-
 fs/sysfs/symlink.c                            |  2 +-
 fs/sysv/Kconfig                               |  2 +-
 fs/udf/Kconfig                                |  2 +-
 include/linux/kobject.h                       |  2 +-
 include/linux/kobject_ns.h                    |  2 +-
 include/linux/relay.h                         |  2 +-
 include/linux/sysfs.h                         |  2 +-
 kernel/relay.c                                |  2 +-
 lib/kobject.c                                 |  4 +-
 48 files changed, 86 insertions(+), 86 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-devices-node b/Documentation/ABI/stable/sysfs-devices-node
index df8413cf1468..484fc04bcc25 100644
--- a/Documentation/ABI/stable/sysfs-devices-node
+++ b/Documentation/ABI/stable/sysfs-devices-node
@@ -54,7 +54,7 @@ Date:		October 2002
 Contact:	Linux Memory Management list <linux-mm@kvack.org>
 Description:
 		Provides information about the node's distribution and memory
-		utilization. Similar to /proc/meminfo, see Documentation/filesystems/proc.txt
+		utilization. Similar to /proc/meminfo, see Documentation/filesystems/proc.rst
 
 What:		/sys/devices/system/node/nodeX/numastat
 Date:		October 2002
diff --git a/Documentation/ABI/testing/procfs-smaps_rollup b/Documentation/ABI/testing/procfs-smaps_rollup
index 274df44d8b1b..046978193368 100644
--- a/Documentation/ABI/testing/procfs-smaps_rollup
+++ b/Documentation/ABI/testing/procfs-smaps_rollup
@@ -11,7 +11,7 @@ Description:
 		Additionally, the fields Pss_Anon, Pss_File and Pss_Shmem
 		are not present in /proc/pid/smaps.  These fields represent
 		the sum of the Pss field of each type (anon, file, shmem).
-		For more details, see Documentation/filesystems/proc.txt
+		For more details, see Documentation/filesystems/proc.rst
 		and the procfs man page.
 
 		Typical output looks like this:
diff --git a/Documentation/admin-guide/cpu-load.rst b/Documentation/admin-guide/cpu-load.rst
index 2d01ce43d2a2..ebdecf864080 100644
--- a/Documentation/admin-guide/cpu-load.rst
+++ b/Documentation/admin-guide/cpu-load.rst
@@ -105,7 +105,7 @@ References
 ----------
 
 - http://lkml.org/lkml/2007/2/12/6
-- Documentation/filesystems/proc.txt (1.8)
+- Documentation/filesystems/proc.rst (1.8)
 
 
 Thanks
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 28be91d4e66b..192a36a66fc9 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -683,7 +683,7 @@
 	coredump_filter=
 			[KNL] Change the default value for
 			/proc/<pid>/coredump_filter.
-			See also Documentation/filesystems/proc.txt.
+			See also Documentation/filesystems/proc.rst.
 
 	coresight_cpu_debug.enable
 			[ARM,ARM64]
diff --git a/Documentation/admin-guide/nfs/nfsroot.rst b/Documentation/admin-guide/nfs/nfsroot.rst
index 82a4fda057f9..c6772075c80c 100644
--- a/Documentation/admin-guide/nfs/nfsroot.rst
+++ b/Documentation/admin-guide/nfs/nfsroot.rst
@@ -18,7 +18,7 @@ Mounting the root filesystem via NFS (nfsroot)
 In order to use a diskless system, such as an X-terminal or printer server for
 example, it is necessary for the root filesystem to be present on a non-disk
 device. This may be an initramfs (see
-Documentation/filesystems/ramfs-rootfs-initramfs.txt), a ramdisk (see
+Documentation/filesystems/ramfs-rootfs-initramfs.rst), a ramdisk (see
 Documentation/admin-guide/initrd.rst) or a filesystem mounted via NFS. The
 following text describes on how to use NFS for the root filesystem. For the rest
 of this text 'client' means the diskless system, and 'server' means the NFS
diff --git a/Documentation/driver-api/driver-model/device.rst b/Documentation/driver-api/driver-model/device.rst
index 2b868d49d349..b9b022371e85 100644
--- a/Documentation/driver-api/driver-model/device.rst
+++ b/Documentation/driver-api/driver-model/device.rst
@@ -50,10 +50,10 @@ Attributes
 
 Attributes of devices can be exported by a device driver through sysfs.
 
-Please see Documentation/filesystems/sysfs.txt for more information
+Please see Documentation/filesystems/sysfs.rst for more information
 on how sysfs works.
 
-As explained in Documentation/kobject.txt, device attributes must be
+As explained in Documentation/core-api/kobject.rst, device attributes must be
 created before the KOBJ_ADD uevent is generated. The only way to realize
 that is by defining an attribute group.
 
diff --git a/Documentation/driver-api/driver-model/overview.rst b/Documentation/driver-api/driver-model/overview.rst
index d4d1e9b40e0c..e98d0ab4a9b6 100644
--- a/Documentation/driver-api/driver-model/overview.rst
+++ b/Documentation/driver-api/driver-model/overview.rst
@@ -121,4 +121,4 @@ device-specific data or tunable interfaces.
 
 More information about the sysfs directory layout can be found in
 the other documents in this directory and in the file
-Documentation/filesystems/sysfs.txt.
+Documentation/filesystems/sysfs.rst.
diff --git a/Documentation/filesystems/dax.txt b/Documentation/filesystems/dax.txt
index 679729442fd2..735f3859b19f 100644
--- a/Documentation/filesystems/dax.txt
+++ b/Documentation/filesystems/dax.txt
@@ -74,7 +74,7 @@ are zeroed out and converted to written extents before being returned to avoid
 exposure of uninitialized data through mmap.
 
 These filesystems may be used for inspiration:
-- ext2: see Documentation/filesystems/ext2.txt
+- ext2: see Documentation/filesystems/ext2.rst
 - ext4: see Documentation/filesystems/ext4/
 - xfs:  see Documentation/admin-guide/xfs.rst
 
diff --git a/Documentation/filesystems/dnotify.txt b/Documentation/filesystems/dnotify.txt
index 15156883d321..08d575ece45d 100644
--- a/Documentation/filesystems/dnotify.txt
+++ b/Documentation/filesystems/dnotify.txt
@@ -67,4 +67,4 @@ See tools/testing/selftests/filesystems/dnotify_test.c for an example.
 NOTE
 ----
 Beginning with Linux 2.6.13, dnotify has been replaced by inotify.
-See Documentation/filesystems/inotify.txt for more information on it.
+See Documentation/filesystems/inotify.rst for more information on it.
diff --git a/Documentation/filesystems/ramfs-rootfs-initramfs.rst b/Documentation/filesystems/ramfs-rootfs-initramfs.rst
index 6c576e241d86..3fddacc6bf14 100644
--- a/Documentation/filesystems/ramfs-rootfs-initramfs.rst
+++ b/Documentation/filesystems/ramfs-rootfs-initramfs.rst
@@ -71,7 +71,7 @@ be allowed write access to a ramfs mount.
 
 A ramfs derivative called tmpfs was created to add size limits, and the ability
 to write the data to swap space.  Normal users can be allowed write access to
-tmpfs mounts.  See Documentation/filesystems/tmpfs.txt for more information.
+tmpfs mounts.  See Documentation/filesystems/tmpfs.rst for more information.
 
 What is rootfs?
 ---------------
diff --git a/Documentation/filesystems/sysfs.rst b/Documentation/filesystems/sysfs.rst
index 290891c3fecb..ab0f7795792b 100644
--- a/Documentation/filesystems/sysfs.rst
+++ b/Documentation/filesystems/sysfs.rst
@@ -20,7 +20,7 @@ a means to export kernel data structures, their attributes, and the
 linkages between them to userspace.
 
 sysfs is tied inherently to the kobject infrastructure. Please read
-Documentation/kobject.txt for more information concerning the kobject
+Documentation/core-api/kobject.rst for more information concerning the kobject
 interface.
 
 
diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index b3f3ee135dbe..20ea8cdee0aa 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -344,7 +344,7 @@ Here is the list of files under powerpc debugfs:
 
 
 NOTE:
-      Please refer to Documentation/filesystems/debugfs.txt on
+      Please refer to Documentation/filesystems/debugfs.rst on
       how to mount the debugfs filesystem.
 
 
diff --git a/Documentation/process/adding-syscalls.rst b/Documentation/process/adding-syscalls.rst
index 1c3a840d06b9..a6b4a3a5bf3f 100644
--- a/Documentation/process/adding-syscalls.rst
+++ b/Documentation/process/adding-syscalls.rst
@@ -33,7 +33,7 @@ interface.
        to a somewhat opaque API.
 
  - If you're just exposing runtime system information, a new node in sysfs
-   (see ``Documentation/filesystems/sysfs.txt``) or the ``/proc`` filesystem may
+   (see ``Documentation/filesystems/sysfs.rst``) or the ``/proc`` filesystem may
    be more appropriate.  However, access to these mechanisms requires that the
    relevant filesystem is mounted, which might not always be the case (e.g.
    in a namespaced/sandboxed/chrooted environment).  Avoid adding any API to
diff --git a/Documentation/translations/it_IT/process/adding-syscalls.rst b/Documentation/translations/it_IT/process/adding-syscalls.rst
index c3a3439595a6..bff0a82bf127 100644
--- a/Documentation/translations/it_IT/process/adding-syscalls.rst
+++ b/Documentation/translations/it_IT/process/adding-syscalls.rst
@@ -39,7 +39,7 @@ vostra interfaccia.
        un qualche modo opaca.
 
  - Se dovete esporre solo delle informazioni sul sistema, un nuovo nodo in
-   sysfs (vedere ``Documentation/filesystems/sysfs.txt``) o
+   sysfs (vedere ``Documentation/filesystems/sysfs.rst``) o
    in procfs potrebbe essere sufficiente.  Tuttavia, l'accesso a questi
    meccanismi richiede che il filesystem sia montato, il che potrebbe non
    essere sempre vero (per esempio, in ambienti come namespace/sandbox/chroot).
diff --git a/Documentation/translations/zh_CN/filesystems/sysfs.txt b/Documentation/translations/zh_CN/filesystems/sysfs.txt
index a15c3ebdfa82..fcf620049d11 100644
--- a/Documentation/translations/zh_CN/filesystems/sysfs.txt
+++ b/Documentation/translations/zh_CN/filesystems/sysfs.txt
@@ -1,4 +1,4 @@
-Chinese translated version of Documentation/filesystems/sysfs.txt
+Chinese translated version of Documentation/filesystems/sysfs.rst
 
 If you have any comment or update to the content, please contact the
 original document maintainer directly.  However, if you have a problem
@@ -10,7 +10,7 @@ Maintainer: Patrick Mochel	<mochel@osdl.org>
 		Mike Murphy <mamurph@cs.clemson.edu>
 Chinese maintainer: Fu Wei <tekkamanninja@gmail.com>
 ---------------------------------------------------------------------
-Documentation/filesystems/sysfs.txt 的中文翻译
+Documentation/filesystems/sysfs.rst 的中文翻译
 
 如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
 交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
@@ -40,7 +40,7 @@ sysfs 是一个最初基于 ramfs 且位于内存的文件系统。它提供导
 数据结构及其属性，以及它们之间的关联到用户空间的方法。
 
 sysfs 始终与 kobject 的底层结构紧密相关。请阅读
-Documentation/kobject.txt 文档以获得更多关于 kobject 接口的
+Documentation/core-api/kobject.rst 文档以获得更多关于 kobject 接口的
 信息。
 
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 84cb39b5a23b..f5ca9ebcb96b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -214,7 +214,7 @@ Q:	http://patchwork.kernel.org/project/v9fs-devel/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs.git
 T:	git git://github.com/martinetd/linux.git
 S:	Maintained
-F:	Documentation/filesystems/9p.txt
+F:	Documentation/filesystems/9p.rst
 F:	fs/9p/
 F:	net/9p/
 F:	include/net/9p/
@@ -584,7 +584,7 @@ AFFS FILE SYSTEM
 M:	David Sterba <dsterba@suse.com>
 L:	linux-fsdevel@vger.kernel.org
 S:	Odd Fixes
-F:	Documentation/filesystems/affs.txt
+F:	Documentation/filesystems/affs.rst
 F:	fs/affs/
 
 AFS FILESYSTEM
@@ -593,7 +593,7 @@ L:	linux-afs@lists.infradead.org
 S:	Supported
 F:	fs/afs/
 F:	include/trace/events/afs.h
-F:	Documentation/filesystems/afs.txt
+F:	Documentation/filesystems/afs.rst
 W:	https://www.infradead.org/~dhowells/kafs/
 
 AGPGART DRIVER
@@ -3079,7 +3079,7 @@ M:	Luis de Bethencourt <luisbg@kernel.org>
 M:	Salah Triki <salah.triki@gmail.com>
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/luisbg/linux-befs.git
-F:	Documentation/filesystems/befs.txt
+F:	Documentation/filesystems/befs.rst
 F:	fs/befs/
 
 BFQ I/O SCHEDULER
@@ -3093,7 +3093,7 @@ F:	Documentation/block/bfq-iosched.rst
 BFS FILE SYSTEM
 M:	"Tigran A. Aivazian" <aivazian.tigran@gmail.com>
 S:	Maintained
-F:	Documentation/filesystems/bfs.txt
+F:	Documentation/filesystems/bfs.rst
 F:	fs/bfs/
 F:	include/uapi/linux/bfs_fs.h
 
@@ -3637,7 +3637,7 @@ W:	http://btrfs.wiki.kernel.org/
 Q:	http://patchwork.kernel.org/project/linux-btrfs/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mason/linux-btrfs.git
 S:	Maintained
-F:	Documentation/filesystems/btrfs.txt
+F:	Documentation/filesystems/btrfs.rst
 F:	fs/btrfs/
 F:	include/linux/btrfs*
 F:	include/uapi/linux/btrfs*
@@ -3934,7 +3934,7 @@ W:	http://ceph.com/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sage/ceph-client.git
 T:	git git://github.com/ceph/ceph-client.git
 S:	Supported
-F:	Documentation/filesystems/ceph.txt
+F:	Documentation/filesystems/ceph.rst
 F:	fs/ceph/
 
 CERTIFICATE HANDLING
@@ -4446,7 +4446,7 @@ F:	include/linux/cpuidle.h
 CRAMFS FILESYSTEM
 M:	Nicolas Pitre <nico@fluxnic.net>
 S:	Maintained
-F:	Documentation/filesystems/cramfs.txt
+F:	Documentation/filesystems/cramfs.rst
 F:	fs/cramfs/
 
 CREATIVE SB0540
@@ -5996,7 +5996,7 @@ W:	http://ecryptfs.org
 W:	https://launchpad.net/ecryptfs
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git
 S:	Odd Fixes
-F:	Documentation/filesystems/ecryptfs.txt
+F:	Documentation/filesystems/ecryptfs.rst
 F:	fs/ecryptfs/
 
 EDAC-AMD64
@@ -6317,7 +6317,7 @@ M:	Chao Yu <yuchao0@huawei.com>
 L:	linux-erofs@lists.ozlabs.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git
-F:	Documentation/filesystems/erofs.txt
+F:	Documentation/filesystems/erofs.rst
 F:	fs/erofs/
 F:	include/trace/events/erofs.h
 
@@ -6379,7 +6379,7 @@ EXT2 FILE SYSTEM
 M:	Jan Kara <jack@suse.com>
 L:	linux-ext4@vger.kernel.org
 S:	Maintained
-F:	Documentation/filesystems/ext2.txt
+F:	Documentation/filesystems/ext2.rst
 F:	fs/ext2/
 F:	include/linux/ext2*
 
@@ -6452,7 +6452,7 @@ L:	linux-f2fs-devel@lists.sourceforge.net
 W:	https://f2fs.wiki.kernel.org/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 S:	Maintained
-F:	Documentation/filesystems/f2fs.txt
+F:	Documentation/filesystems/f2fs.rst
 F:	Documentation/ABI/testing/sysfs-fs-f2fs
 F:	fs/f2fs/
 F:	include/linux/f2fs_fs.h
@@ -7501,13 +7501,13 @@ F:	drivers/infiniband/hw/hfi1
 HFS FILESYSTEM
 L:	linux-fsdevel@vger.kernel.org
 S:	Orphan
-F:	Documentation/filesystems/hfs.txt
+F:	Documentation/filesystems/hfs.rst
 F:	fs/hfs/
 
 HFSPLUS FILESYSTEM
 L:	linux-fsdevel@vger.kernel.org
 S:	Orphan
-F:	Documentation/filesystems/hfsplus.txt
+F:	Documentation/filesystems/hfsplus.rst
 F:	fs/hfsplus/
 
 HGA FRAMEBUFFER DRIVER
@@ -8383,7 +8383,7 @@ M:	Jan Kara <jack@suse.cz>
 R:	Amir Goldstein <amir73il@gmail.com>
 L:	linux-fsdevel@vger.kernel.org
 S:	Maintained
-F:	Documentation/filesystems/inotify.txt
+F:	Documentation/filesystems/inotify.rst
 F:	fs/notify/inotify/
 F:	include/linux/inotify.h
 F:	include/uapi/linux/inotify.h
@@ -11895,7 +11895,7 @@ W:	https://nilfs.sourceforge.io/
 W:	https://nilfs.osdn.jp/
 T:	git git://github.com/konis/nilfs2.git
 S:	Supported
-F:	Documentation/filesystems/nilfs2.txt
+F:	Documentation/filesystems/nilfs2.rst
 F:	fs/nilfs2/
 F:	include/trace/events/nilfs2.h
 F:	include/uapi/linux/nilfs2_api.h
@@ -12005,7 +12005,7 @@ L:	linux-ntfs-dev@lists.sourceforge.net
 W:	http://www.tuxera.com/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/aia21/ntfs.git
 S:	Supported
-F:	Documentation/filesystems/ntfs.txt
+F:	Documentation/filesystems/ntfs.rst
 F:	fs/ntfs/
 
 NUBUS SUBSYSTEM
@@ -12351,7 +12351,7 @@ OMFS FILESYSTEM
 M:	Bob Copeland <me@bobcopeland.com>
 L:	linux-karma-devel@lists.sourceforge.net
 S:	Maintained
-F:	Documentation/filesystems/omfs.txt
+F:	Documentation/filesystems/omfs.rst
 F:	fs/omfs/
 
 OMNIKEY CARDMAN 4000 DRIVER
@@ -12599,8 +12599,8 @@ M:	Joseph Qi <joseph.qi@linux.alibaba.com>
 L:	ocfs2-devel@oss.oracle.com (moderated for non-subscribers)
 W:	http://ocfs2.wiki.kernel.org
 S:	Supported
-F:	Documentation/filesystems/ocfs2.txt
-F:	Documentation/filesystems/dlmfs.txt
+F:	Documentation/filesystems/ocfs2.rst
+F:	Documentation/filesystems/dlmfs.rst
 F:	fs/ocfs2/
 
 ORANGEFS FILESYSTEM
@@ -12610,7 +12610,7 @@ L:	devel@lists.orangefs.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux.git
 S:	Supported
 F:	fs/orangefs/
-F:	Documentation/filesystems/orangefs.txt
+F:	Documentation/filesystems/orangefs.rst
 
 ORINOCO DRIVER
 L:	linux-wireless@vger.kernel.org
@@ -13573,7 +13573,7 @@ S:	Maintained
 F:	fs/proc/
 F:	include/linux/proc_fs.h
 F:	tools/testing/selftests/proc/
-F:	Documentation/filesystems/proc.txt
+F:	Documentation/filesystems/proc.rst
 
 PROC SYSCTL
 M:	Luis Chamberlain <mcgrof@kernel.org>
@@ -15869,7 +15869,7 @@ L:	squashfs-devel@lists.sourceforge.net (subscribers-only)
 W:	http://squashfs.org.uk
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pkl/squashfs-next.git
 S:	Maintained
-F:	Documentation/filesystems/squashfs.txt
+F:	Documentation/filesystems/squashfs.rst
 F:	fs/squashfs/
 
 SRM (Alpha) environment access
@@ -16320,7 +16320,7 @@ F:	drivers/platform/x86/system76_acpi.c
 SYSV FILESYSTEM
 M:	Christoph Hellwig <hch@infradead.org>
 S:	Maintained
-F:	Documentation/filesystems/sysv-fs.txt
+F:	Documentation/filesystems/sysv-fs.rst
 F:	fs/sysv/
 F:	include/linux/sysv_fs.h
 
@@ -17197,7 +17197,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git next
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git fixes
 W:	http://www.linux-mtd.infradead.org/doc/ubifs.html
 S:	Supported
-F:	Documentation/filesystems/ubifs.txt
+F:	Documentation/filesystems/ubifs.rst
 F:	fs/ubifs/
 
 UCLINUX (M68KNOMMU AND COLDFIRE)
@@ -17216,7 +17216,7 @@ F:	arch/m68k/include/asm/*_no.*
 UDF FILESYSTEM
 M:	Jan Kara <jack@suse.com>
 S:	Maintained
-F:	Documentation/filesystems/udf.txt
+F:	Documentation/filesystems/udf.rst
 F:	fs/udf/
 
 UDRAW TABLET
@@ -18663,7 +18663,7 @@ L:	linux-fsdevel@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/zonefs.git
 S:	Maintained
 F:	fs/zonefs/
-F:	Documentation/filesystems/zonefs.txt
+F:	Documentation/filesystems/zonefs.rst
 
 ZPOOL COMPRESSED PAGE STORAGE API
 M:	Dan Streetman <ddstreet@ieee.org>
diff --git a/Next/merge.log b/Next/merge.log
index 7c5d15d865f6..6a9bb9104d6f 100644
--- a/Next/merge.log
+++ b/Next/merge.log
@@ -2510,9 +2510,9 @@ Auto-merging Documentation/kbuild/index.rst
 CONFLICT (content): Merge conflict in Documentation/kbuild/index.rst
 Auto-merging Documentation/filesystems/zonefs.rst
 CONFLICT (content): Merge conflict in Documentation/filesystems/zonefs.rst
-Removing Documentation/filesystems/omfs.txt
+Removing Documentation/filesystems/omfs.rst
 Removing Documentation/filesystems/nfs/nfs41-server.txt
-Removing Documentation/filesystems/isofs.txt
+Removing Documentation/filesystems/isofs.rst
 Auto-merging Documentation/filesystems/debugfs.rst
 Removing Documentation/debugging-modules.txt
 Auto-merging Documentation/admin-guide/kernel-parameters.txt
@@ -2580,7 +2580,7 @@ $ git diff -M --stat --summary HEAD^..
  Documentation/filesystems/index.rst                |   45 +
  .../filesystems/{inotify.txt => inotify.rst}       |   33 +-
  Documentation/filesystems/isofs.rst                |   64 +
- Documentation/filesystems/isofs.txt                |   48 -
+ Documentation/filesystems/isofs.rst                |   48 -
  Documentation/filesystems/nfs/index.rst            |   13 +
  .../nfs/{knfsd-stats.txt => knfsd-stats.rst}       |   17 +-
  Documentation/filesystems/nfs/nfs41-server.rst     |  256 ++++
@@ -2593,7 +2593,7 @@ $ git diff -M --stat --summary HEAD^..
  ...ne-filecheck.txt => ocfs2-online-filecheck.rst} |   45 +-
  Documentation/filesystems/{ocfs2.txt => ocfs2.rst} |   31 +-
  Documentation/filesystems/omfs.rst                 |  112 ++
- Documentation/filesystems/omfs.txt                 |  106 --
+ Documentation/filesystems/omfs.rst                 |  106 --
  .../filesystems/{orangefs.txt => orangefs.rst}     |  187 ++-
  Documentation/filesystems/{proc.txt => proc.rst}   | 1544 +++++++++++---------
  Documentation/filesystems/{qnx6.txt => qnx6.rst}   |   22 +
@@ -2681,7 +2681,7 @@ $ git diff -M --stat --summary HEAD^..
  rename Documentation/filesystems/{hpfs.txt => hpfs.rst} (66%)
  rename Documentation/filesystems/{inotify.txt => inotify.rst} (83%)
  create mode 100644 Documentation/filesystems/isofs.rst
- delete mode 100644 Documentation/filesystems/isofs.txt
+ delete mode 100644 Documentation/filesystems/isofs.rst
  create mode 100644 Documentation/filesystems/nfs/index.rst
  rename Documentation/filesystems/nfs/{knfsd-stats.txt => knfsd-stats.rst} (95%)
  create mode 100644 Documentation/filesystems/nfs/nfs41-server.rst
@@ -2694,7 +2694,7 @@ $ git diff -M --stat --summary HEAD^..
  rename Documentation/filesystems/{ocfs2-online-filecheck.txt => ocfs2-online-filecheck.rst} (77%)
  rename Documentation/filesystems/{ocfs2.txt => ocfs2.rst} (88%)
  create mode 100644 Documentation/filesystems/omfs.rst
- delete mode 100644 Documentation/filesystems/omfs.txt
+ delete mode 100644 Documentation/filesystems/omfs.rst
  rename Documentation/filesystems/{orangefs.txt => orangefs.rst} (83%)
  rename Documentation/filesystems/{proc.txt => proc.rst} (65%)
  rename Documentation/filesystems/{qnx6.txt => qnx6.rst} (98%)
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 5b84ba3f8c46..74d065ff7fc4 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1374,7 +1374,7 @@ static void device_release(struct kobject *kobj)
 	else if (dev->class && dev->class->dev_release)
 		dev->class->dev_release(dev);
 	else
-		WARN(1, KERN_ERR "Device '%s' does not have a release() function, it is broken and must be fixed. See Documentation/kobject.txt.\n",
+		WARN(1, KERN_ERR "Device '%s' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.\n",
 			dev_name(dev));
 	kfree(p);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index c6169e7df19d..16a3f00a745a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -144,7 +144,7 @@ struct vsync_info {
  *
  * Main debugfs documentation is located at,
  *
- * Documentation/filesystems/debugfs.txt
+ * Documentation/filesystems/debugfs.rst
  *
  * @dpu_debugfs_setup_regset32: Initialize data for dpu_debugfs_create_regset32
  * @dpu_debugfs_create_regset32: Create 32-bit register dump file
diff --git a/fs/Kconfig b/fs/Kconfig
index f08fbbfafd9a..d1ad3935fb85 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -166,7 +166,7 @@ config TMPFS
 	  space. If you unmount a tmpfs instance, everything stored therein is
 	  lost.
 
-	  See <file:Documentation/filesystems/tmpfs.txt> for details.
+	  See <file:Documentation/filesystems/tmpfs.rst> for details.
 
 config TMPFS_POSIX_ACL
 	bool "Tmpfs POSIX Access Control Lists"
diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
index 62dc4f577ba1..3fbbd54f50fd 100644
--- a/fs/Kconfig.binfmt
+++ b/fs/Kconfig.binfmt
@@ -72,7 +72,7 @@ config CORE_DUMP_DEFAULT_ELF_HEADERS
 
 	  The core dump behavior can be controlled per process using
 	  the /proc/PID/coredump_filter pseudo-file; this setting is
-	  inherited.  See Documentation/filesystems/proc.txt for details.
+	  inherited.  See Documentation/filesystems/proc.rst for details.
 
 	  This config option changes the default setting of coredump_filter
 	  seen at boot time.  If unsure, say Y.
diff --git a/fs/adfs/Kconfig b/fs/adfs/Kconfig
index df4650dccf68..44738fed6625 100644
--- a/fs/adfs/Kconfig
+++ b/fs/adfs/Kconfig
@@ -12,7 +12,7 @@ config ADFS_FS
 
 	  The ADFS partition should be the first partition (i.e.,
 	  /dev/[hs]d?1) on each of your drives. Please read the file
-	  <file:Documentation/filesystems/adfs.txt> for further details.
+	  <file:Documentation/filesystems/adfs.rst> for further details.
 
 	  To compile this code as a module, choose M here: the module will be
 	  called adfs.
diff --git a/fs/affs/Kconfig b/fs/affs/Kconfig
index 84c46b9025c5..eb9d0ab850cb 100644
--- a/fs/affs/Kconfig
+++ b/fs/affs/Kconfig
@@ -9,7 +9,7 @@ config AFFS_FS
 	  FFS partition on your hard drive.  Amiga floppies however cannot be
 	  read with this driver due to an incompatibility of the floppy
 	  controller used in an Amiga and the standard floppy controller in
-	  PCs and workstations. Read <file:Documentation/filesystems/affs.txt>
+	  PCs and workstations. Read <file:Documentation/filesystems/affs.rst>
 	  and <file:fs/affs/Changes>.
 
 	  With this driver you can also mount disk files used by Bernd
diff --git a/fs/afs/Kconfig b/fs/afs/Kconfig
index 3fb1f559e317..1ad211d72b3b 100644
--- a/fs/afs/Kconfig
+++ b/fs/afs/Kconfig
@@ -8,7 +8,7 @@ config AFS_FS
 	  If you say Y here, you will get an experimental Andrew File System
 	  driver. It currently only supports unsecured read-only AFS access.
 
-	  See <file:Documentation/filesystems/afs.txt> for more information.
+	  See <file:Documentation/filesystems/afs.rst> for more information.
 
 	  If unsure, say N.
 
@@ -18,7 +18,7 @@ config AFS_DEBUG
 	help
 	  Say Y here to make runtime controllable debugging messages appear.
 
-	  See <file:Documentation/filesystems/afs.txt> for more information.
+	  See <file:Documentation/filesystems/afs.rst> for more information.
 
 	  If unsure, say N.
 
@@ -37,6 +37,6 @@ config AFS_DEBUG_CURSOR
 	  the dmesg log if the server rotation algorithm fails to successfully
 	  contact a server.
 
-	  See <file:Documentation/filesystems/afs.txt> for more information.
+	  See <file:Documentation/filesystems/afs.rst> for more information.
 
 	  If unsure, say N.
diff --git a/fs/bfs/Kconfig b/fs/bfs/Kconfig
index 3e1247f07913..3a757805b585 100644
--- a/fs/bfs/Kconfig
+++ b/fs/bfs/Kconfig
@@ -11,7 +11,7 @@ config BFS_FS
 	  on your /stand slice from within Linux.  You then also need to say Y
 	  to "UnixWare slices support", below.  More information about the BFS
 	  file system is contained in the file
-	  <file:Documentation/filesystems/bfs.txt>.
+	  <file:Documentation/filesystems/bfs.rst>.
 
 	  If you don't know what this is about, say N.
 
diff --git a/fs/cramfs/Kconfig b/fs/cramfs/Kconfig
index c8bebb70a971..d98cef0dbb6b 100644
--- a/fs/cramfs/Kconfig
+++ b/fs/cramfs/Kconfig
@@ -9,7 +9,7 @@ config CRAMFS
 	  limited to 256MB file systems (with 16MB files), and doesn't support
 	  16/32 bits uid/gid, hard links and timestamps.
 
-	  See <file:Documentation/filesystems/cramfs.txt> and
+	  See <file:Documentation/filesystems/cramfs.rst> and
 	  <file:fs/cramfs/README> for further information.
 
 	  To compile this as a module, choose M here: the module will be called
diff --git a/fs/ecryptfs/Kconfig b/fs/ecryptfs/Kconfig
index 522c35d5292b..1bdeaa6d5790 100644
--- a/fs/ecryptfs/Kconfig
+++ b/fs/ecryptfs/Kconfig
@@ -7,7 +7,7 @@ config ECRYPT_FS
 	select CRYPTO_MD5
 	help
 	  Encrypted filesystem that operates on the VFS layer.  See
-	  <file:Documentation/filesystems/ecryptfs.txt> to learn more about
+	  <file:Documentation/filesystems/ecryptfs.rst> to learn more about
 	  eCryptfs.  Userspace components are required and can be
 	  obtained from <http://ecryptfs.sf.net>.
 
diff --git a/fs/hfs/Kconfig b/fs/hfs/Kconfig
index 44f6e89bcb75..129926b5142d 100644
--- a/fs/hfs/Kconfig
+++ b/fs/hfs/Kconfig
@@ -6,7 +6,7 @@ config HFS_FS
 	help
 	  If you say Y here, you will be able to mount Macintosh-formatted
 	  floppy disks and hard drive partitions with full read-write access.
-	  Please read <file:Documentation/filesystems/hfs.txt> to learn about
+	  Please read <file:Documentation/filesystems/hfs.rst> to learn about
 	  the available mount options.
 
 	  To compile this file system support as a module, choose M here: the
diff --git a/fs/hpfs/Kconfig b/fs/hpfs/Kconfig
index 56aa0336254a..2b36dc6f0a10 100644
--- a/fs/hpfs/Kconfig
+++ b/fs/hpfs/Kconfig
@@ -9,7 +9,7 @@ config HPFS_FS
 	  write files to an OS/2 HPFS partition on your hard drive. OS/2
 	  floppies however are in regular MSDOS format, so you don't need this
 	  option in order to be able to read them. Read
-	  <file:Documentation/filesystems/hpfs.txt>.
+	  <file:Documentation/filesystems/hpfs.rst>.
 
 	  To compile this file system support as a module, choose M here: the
 	  module will be called hpfs.  If unsure, say N.
diff --git a/fs/isofs/Kconfig b/fs/isofs/Kconfig
index 5e7419599f50..08ffd37b9bb8 100644
--- a/fs/isofs/Kconfig
+++ b/fs/isofs/Kconfig
@@ -8,7 +8,7 @@ config ISO9660_FS
 	  long Unix filenames and symbolic links are also supported by this
 	  driver.  If you have a CD-ROM drive and want to do more with it than
 	  just listen to audio CDs and watch its LEDs, say Y (and read
-	  <file:Documentation/filesystems/isofs.txt> and the CD-ROM-HOWTO,
+	  <file:Documentation/filesystems/isofs.rst> and the CD-ROM-HOWTO,
 	  available from <http://www.tldp.org/docs.html#howto>), thereby
 	  enlarging your kernel by about 27 KB; otherwise say N.
 
diff --git a/fs/namespace.c b/fs/namespace.c
index e6aed405611d..894a1d12fe5f 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -3592,7 +3592,7 @@ EXPORT_SYMBOL(path_is_under);
  * file system may be mounted on put_old. After all, new_root is a mountpoint.
  *
  * Also, the current root cannot be on the 'rootfs' (initial ramfs) filesystem.
- * See Documentation/filesystems/ramfs-rootfs-initramfs.txt for alternatives
+ * See Documentation/filesystems/ramfs-rootfs-initramfs.rst for alternatives
  * in this situation.
  *
  * Notes:
diff --git a/fs/notify/inotify/Kconfig b/fs/notify/inotify/Kconfig
index 6736e47d94d8..7715fadd5fff 100644
--- a/fs/notify/inotify/Kconfig
+++ b/fs/notify/inotify/Kconfig
@@ -12,6 +12,6 @@ config INOTIFY_USER
 	  new features including multiple file events, one-shot support, and
 	  unmount notification.
 
-	  For more information, see <file:Documentation/filesystems/inotify.txt>
+	  For more information, see <file:Documentation/filesystems/inotify.rst>
 
 	  If unsure, say Y.
diff --git a/fs/ntfs/Kconfig b/fs/ntfs/Kconfig
index de9fb5cff226..1667a7e590d8 100644
--- a/fs/ntfs/Kconfig
+++ b/fs/ntfs/Kconfig
@@ -18,7 +18,7 @@ config NTFS_FS
 	  the Linux 2.4 kernel series is separately available as a patch
 	  from the project web site.
 
-	  For more information see <file:Documentation/filesystems/ntfs.txt>
+	  For more information see <file:Documentation/filesystems/ntfs.rst>
 	  and <http://www.linux-ntfs.org/>.
 
 	  To compile this file system support as a module, choose M here: the
diff --git a/fs/ocfs2/Kconfig b/fs/ocfs2/Kconfig
index 46bba20da6b5..1177c33df895 100644
--- a/fs/ocfs2/Kconfig
+++ b/fs/ocfs2/Kconfig
@@ -21,7 +21,7 @@ config OCFS2_FS
 	  OCFS2 mailing lists: http://oss.oracle.com/projects/ocfs2/mailman/
 
 	  For more information on OCFS2, see the file
-	  <file:Documentation/filesystems/ocfs2.txt>.
+	  <file:Documentation/filesystems/ocfs2.rst>.
 
 config OCFS2_FS_O2CB
 	tristate "O2CB Kernelspace Clustering"
diff --git a/fs/proc/Kconfig b/fs/proc/Kconfig
index 27ef84d99f59..971a42f6357d 100644
--- a/fs/proc/Kconfig
+++ b/fs/proc/Kconfig
@@ -23,7 +23,7 @@ config PROC_FS
 	  /proc" or the equivalent line in /etc/fstab does the job.
 
 	  The /proc file system is explained in the file
-	  <file:Documentation/filesystems/proc.txt> and on the proc(5) manpage
+	  <file:Documentation/filesystems/proc.rst> and on the proc(5) manpage
 	  ("man 5 proc").
 
 	  This option will enlarge your kernel by about 67 KB. Several
@@ -95,7 +95,7 @@ config PROC_CHILDREN
 	default n
 	help
 	  Provides a fast way to retrieve first level children pids of a task. See
-	  <file:Documentation/filesystems/proc.txt> for more information.
+	  <file:Documentation/filesystems/proc.rst> for more information.
 
 	  Say Y if you are running any user-space software which takes benefit from
 	  this interface. For example, rkt is such a piece of software.
diff --git a/fs/romfs/Kconfig b/fs/romfs/Kconfig
index ad4c45788896..9737b8e68878 100644
--- a/fs/romfs/Kconfig
+++ b/fs/romfs/Kconfig
@@ -6,7 +6,7 @@ config ROMFS_FS
 	  This is a very small read-only file system mainly intended for
 	  initial ram disks of installation disks, but it could be used for
 	  other read-only media as well.  Read
-	  <file:Documentation/filesystems/romfs.txt> for details.
+	  <file:Documentation/filesystems/romfs.rst> for details.
 
 	  To compile this file system support as a module, choose M here: the
 	  module will be called romfs.  Note that the file system of your
diff --git a/fs/sysfs/dir.c b/fs/sysfs/dir.c
index aa85f2874a9f..59dffd5ca517 100644
--- a/fs/sysfs/dir.c
+++ b/fs/sysfs/dir.c
@@ -6,7 +6,7 @@
  * Copyright (c) 2007 SUSE Linux Products GmbH
  * Copyright (c) 2007 Tejun Heo <teheo@suse.de>
  *
- * Please see Documentation/filesystems/sysfs.txt for more information.
+ * Please see Documentation/filesystems/sysfs.rst for more information.
  */
 
 #define pr_fmt(fmt)	"sysfs: " fmt
diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index 26bbf960e2a2..f275fcda62fb 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -6,7 +6,7 @@
  * Copyright (c) 2007 SUSE Linux Products GmbH
  * Copyright (c) 2007 Tejun Heo <teheo@suse.de>
  *
- * Please see Documentation/filesystems/sysfs.txt for more information.
+ * Please see Documentation/filesystems/sysfs.rst for more information.
  */
 
 #include <linux/module.h>
diff --git a/fs/sysfs/mount.c b/fs/sysfs/mount.c
index db81cfbab9d6..e747c135c1d1 100644
--- a/fs/sysfs/mount.c
+++ b/fs/sysfs/mount.c
@@ -6,7 +6,7 @@
  * Copyright (c) 2007 SUSE Linux Products GmbH
  * Copyright (c) 2007 Tejun Heo <teheo@suse.de>
  *
- * Please see Documentation/filesystems/sysfs.txt for more information.
+ * Please see Documentation/filesystems/sysfs.rst for more information.
  */
 
 #include <linux/fs.h>
diff --git a/fs/sysfs/symlink.c b/fs/sysfs/symlink.c
index c4deecc80f67..5603530a1a52 100644
--- a/fs/sysfs/symlink.c
+++ b/fs/sysfs/symlink.c
@@ -6,7 +6,7 @@
  * Copyright (c) 2007 SUSE Linux Products GmbH
  * Copyright (c) 2007 Tejun Heo <teheo@suse.de>
  *
- * Please see Documentation/filesystems/sysfs.txt for more information.
+ * Please see Documentation/filesystems/sysfs.rst for more information.
  */
 
 #include <linux/fs.h>
diff --git a/fs/sysv/Kconfig b/fs/sysv/Kconfig
index d4edf7d9ae10..b4e23e03fbeb 100644
--- a/fs/sysv/Kconfig
+++ b/fs/sysv/Kconfig
@@ -28,7 +28,7 @@ config SYSV_FS
 	  tar" or preferably "info tar").  Note also that this option has
 	  nothing whatsoever to do with the option "System V IPC". Read about
 	  the System V file system in
-	  <file:Documentation/filesystems/sysv-fs.txt>.
+	  <file:Documentation/filesystems/sysv-fs.rst>.
 	  Saying Y here will enlarge your kernel by about 27 KB.
 
 	  To compile this as a module, choose M here: the module will be called
diff --git a/fs/udf/Kconfig b/fs/udf/Kconfig
index 6848de581ce1..26e1a49f3ba7 100644
--- a/fs/udf/Kconfig
+++ b/fs/udf/Kconfig
@@ -9,7 +9,7 @@ config UDF_FS
 	  compatible with standard unix file systems, it is also suitable for
 	  removable USB disks. Say Y if you intend to mount DVD discs or CDRW's
 	  written in packet mode, or if you want to use UDF for removable USB
-	  disks. Please read <file:Documentation/filesystems/udf.txt>.
+	  disks. Please read <file:Documentation/filesystems/udf.rst>.
 
 	  To compile this file system support as a module, choose M here: the
 	  module will be called udf.
diff --git a/include/linux/kobject.h b/include/linux/kobject.h
index e2ca0a292e21..fc8d83e91379 100644
--- a/include/linux/kobject.h
+++ b/include/linux/kobject.h
@@ -7,7 +7,7 @@
  * Copyright (c) 2006-2008 Greg Kroah-Hartman <greg@kroah.com>
  * Copyright (c) 2006-2008 Novell Inc.
  *
- * Please read Documentation/kobject.txt before using the kobject
+ * Please read Documentation/core-api/kobject.rst before using the kobject
  * interface, ESPECIALLY the parts about reference counts and object
  * destructors.
  */
diff --git a/include/linux/kobject_ns.h b/include/linux/kobject_ns.h
index 069aa2ebef90..2b5b64256cf4 100644
--- a/include/linux/kobject_ns.h
+++ b/include/linux/kobject_ns.h
@@ -8,7 +8,7 @@
  *
  * Split from kobject.h by David Howells (dhowells@redhat.com)
  *
- * Please read Documentation/kobject.txt before using the kobject
+ * Please read Documentation/core-api/kobject.rst before using the kobject
  * interface, ESPECIALLY the parts about reference counts and object
  * destructors.
  */
diff --git a/include/linux/relay.h b/include/linux/relay.h
index c759f96e39c1..e13a333e7c37 100644
--- a/include/linux/relay.h
+++ b/include/linux/relay.h
@@ -141,7 +141,7 @@ struct rchan_callbacks
 	 * cause relay_open() to create a single global buffer rather
 	 * than the default set of per-cpu buffers.
 	 *
-	 * See Documentation/filesystems/relay.txt for more info.
+	 * See Documentation/filesystems/relay.rst for more info.
 	 */
 	struct dentry *(*create_buf_file)(const char *filename,
 					  struct dentry *parent,
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index aae751521d3a..74edf6d728c7 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -7,7 +7,7 @@
  * Copyright (c) 2007 SUSE Linux Products GmbH
  * Copyright (c) 2007 Tejun Heo <teheo@suse.de>
  *
- * Please see Documentation/filesystems/sysfs.txt for more information.
+ * Please see Documentation/filesystems/sysfs.rst for more information.
  */
 
 #ifndef _SYSFS_H_
diff --git a/kernel/relay.c b/kernel/relay.c
index 07ee1a791d85..628f570ca678 100644
--- a/kernel/relay.c
+++ b/kernel/relay.c
@@ -1,7 +1,7 @@
 /*
  * Public API and common code for kernel->userspace relay file support.
  *
- * See Documentation/filesystems/relay.txt for an overview.
+ * See Documentation/filesystems/relay.rst for an overview.
  *
  * Copyright (C) 2002-2005 - Tom Zanussi (zanussi@us.ibm.com), IBM Corp
  * Copyright (C) 1999-2005 - Karim Yaghmour (karim@opersys.com)
diff --git a/lib/kobject.c b/lib/kobject.c
index 83198cb37d8d..65fa7bf70c57 100644
--- a/lib/kobject.c
+++ b/lib/kobject.c
@@ -6,7 +6,7 @@
  * Copyright (c) 2006-2007 Greg Kroah-Hartman <greg@kroah.com>
  * Copyright (c) 2006-2007 Novell Inc.
  *
- * Please see the file Documentation/kobject.txt for critical information
+ * Please see the file Documentation/core-api/kobject.rst for critical information
  * about using the kobject interface.
  */
 
@@ -670,7 +670,7 @@ static void kobject_cleanup(struct kobject *kobj)
 		 kobject_name(kobj), kobj, __func__, kobj->parent);
 
 	if (t && !t->release)
-		pr_debug("kobject: '%s' (%p): does not have a release() function, it is broken and must be fixed. See Documentation/kobject.txt.\n",
+		pr_debug("kobject: '%s' (%p): does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.\n",
 			 kobject_name(kobj), kobj);
 
 	/* send "remove" if the caller did not do it but sent "add" */
-- 
2.24.1

