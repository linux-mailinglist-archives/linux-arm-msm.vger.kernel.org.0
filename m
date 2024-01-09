Return-Path: <linux-arm-msm+bounces-6816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAB8828DC0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 20:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 748461F21717
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 19:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D413FB14;
	Tue,  9 Jan 2024 19:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fpc1hZF6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73843EA7B;
	Tue,  9 Jan 2024 19:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 409HbTnp007926;
	Tue, 9 Jan 2024 19:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=mor3PjSL9nlkSdArAusagsgYfSKA55S60vleqZR3Ge0
	=; b=fpc1hZF6yiMDJBOD7UHjRhR+fqNfWYWI+PRt7PCYWjvF2fRlscjwF0+xipF
	9dKTFaJrvjdSk5TECmgfhcAKVk5i+iuyWcIzeHuNlpvntdv2mB6/Ecv1PUkxRbbk
	nkkfnQAC8zHjRcEg9Kq0iMj9W0YEoGG0IHLG3SBtsEDetMokRo5jV8bcgjrRar2Q
	vGWUhqK8HMX5+AZUwy9PK7B/hR4IJGnuqCSj2UlexJUwMUpEpSykfyVJZyPSBLx1
	pCFcdZuPJukAZgASN3L6AWiFvxxq52gpzswnEm4kum3k9uMZ7kM4QlLWWrJb+O+9
	04An+SJWdU0ancjlK7zfS/re9jg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vh9evrfhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 19:37:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 409Jbwao030416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jan 2024 19:37:58 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 9 Jan 2024 11:37:57 -0800
From: Elliot Berman <quic_eberman@quicinc.com>
Date: Tue, 9 Jan 2024 11:37:51 -0800
Subject: [PATCH v16 13/34] gunyah: vm_mgr: Add framework for VM Functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240109-gunyah-v16-13-634904bf4ce9@quicinc.com>
References: <20240109-gunyah-v16-0-634904bf4ce9@quicinc.com>
In-Reply-To: <20240109-gunyah-v16-0-634904bf4ce9@quicinc.com>
To: Alex Elder <elder@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Murali Nalajal <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri
	<quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Philip Derrin <quic_pderrin@quicinc.com>,
        Prakruthi Deepak Heragu
	<quic_pheragu@quicinc.com>,
        Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Fuad
 Tabba" <tabba@google.com>,
        Sean Christopherson <seanjc@google.com>,
        "Andrew
 Morton" <akpm@linux-foundation.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
        Elliot Berman
	<quic_eberman@quicinc.com>
X-Mailer: b4 0.13-dev
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W6LFEG2ACudCKEUd5w0l_1futlHRQVbP
X-Proofpoint-ORIG-GUID: W6LFEG2ACudCKEUd5w0l_1futlHRQVbP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401090158

Introduce a framework for Gunyah userspace to install VM functions. VM
functions are optional interfaces to the virtual machine. vCPUs,
ioeventfs, and irqfds are examples of such VM functions and are
implemented in subsequent patches.

A generic framework is implemented instead of individual ioctls to
create vCPUs, irqfds, etc., in order to simplify the VM manager core
implementation and allow dynamic loading of VM function modules.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/virt/gunyah/vm_mgr.c | 207 ++++++++++++++++++++++++++++++++++++++++++-
 drivers/virt/gunyah/vm_mgr.h |  10 +++
 include/linux/gunyah.h       |  87 +++++++++++++++++-
 include/uapi/linux/gunyah.h  |  18 ++++
 4 files changed, 318 insertions(+), 4 deletions(-)

diff --git a/drivers/virt/gunyah/vm_mgr.c b/drivers/virt/gunyah/vm_mgr.c
index 65badcf6357b..5d4f413f7a76 100644
--- a/drivers/virt/gunyah/vm_mgr.c
+++ b/drivers/virt/gunyah/vm_mgr.c
@@ -6,15 +6,175 @@
 #define pr_fmt(fmt) "gunyah_vm_mgr: " fmt
 
 #include <linux/anon_inodes.h>
+#include <linux/compat.h>
 #include <linux/file.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
+#include <linux/xarray.h>
 
 #include <uapi/linux/gunyah.h>
 
 #include "rsc_mgr.h"
 #include "vm_mgr.h"
 
+static DEFINE_XARRAY(gunyah_vm_functions);
+
+static void gunyah_vm_put_function(struct gunyah_vm_function *fn)
+{
+	module_put(fn->mod);
+}
+
+static struct gunyah_vm_function *gunyah_vm_get_function(u32 type)
+{
+	struct gunyah_vm_function *fn;
+
+	fn = xa_load(&gunyah_vm_functions, type);
+	if (!fn) {
+		request_module("ghfunc:%d", type);
+
+		fn = xa_load(&gunyah_vm_functions, type);
+	}
+
+	if (!fn || !try_module_get(fn->mod))
+		fn = ERR_PTR(-ENOENT);
+
+	return fn;
+}
+
+static void
+gunyah_vm_remove_function_instance(struct gunyah_vm_function_instance *inst)
+	__must_hold(&inst->ghvm->fn_lock)
+{
+	inst->fn->unbind(inst);
+	list_del(&inst->vm_list);
+	gunyah_vm_put_function(inst->fn);
+	kfree(inst->argp);
+	kfree(inst);
+}
+
+static void gunyah_vm_remove_functions(struct gunyah_vm *ghvm)
+{
+	struct gunyah_vm_function_instance *inst, *iiter;
+
+	mutex_lock(&ghvm->fn_lock);
+	list_for_each_entry_safe(inst, iiter, &ghvm->functions, vm_list) {
+		gunyah_vm_remove_function_instance(inst);
+	}
+	mutex_unlock(&ghvm->fn_lock);
+}
+
+static long gunyah_vm_add_function_instance(struct gunyah_vm *ghvm,
+					    struct gunyah_fn_desc *f)
+{
+	struct gunyah_vm_function_instance *inst;
+	void __user *argp;
+	long r = 0;
+
+	if (f->arg_size > GUNYAH_FN_MAX_ARG_SIZE) {
+		dev_err_ratelimited(ghvm->parent, "%s: arg_size > %d\n",
+				    __func__, GUNYAH_FN_MAX_ARG_SIZE);
+		return -EINVAL;
+	}
+
+	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
+	if (!inst)
+		return -ENOMEM;
+
+	inst->arg_size = f->arg_size;
+	if (inst->arg_size) {
+		inst->argp = kzalloc(inst->arg_size, GFP_KERNEL);
+		if (!inst->argp) {
+			r = -ENOMEM;
+			goto free;
+		}
+
+		argp = u64_to_user_ptr(f->arg);
+		if (copy_from_user(inst->argp, argp, f->arg_size)) {
+			r = -EFAULT;
+			goto free_arg;
+		}
+	}
+
+	inst->fn = gunyah_vm_get_function(f->type);
+	if (IS_ERR(inst->fn)) {
+		r = PTR_ERR(inst->fn);
+		goto free_arg;
+	}
+
+	inst->ghvm = ghvm;
+	inst->rm = ghvm->rm;
+
+	mutex_lock(&ghvm->fn_lock);
+	r = inst->fn->bind(inst);
+	if (r < 0) {
+		mutex_unlock(&ghvm->fn_lock);
+		gunyah_vm_put_function(inst->fn);
+		goto free_arg;
+	}
+
+	list_add(&inst->vm_list, &ghvm->functions);
+	mutex_unlock(&ghvm->fn_lock);
+
+	return r;
+free_arg:
+	kfree(inst->argp);
+free:
+	kfree(inst);
+	return r;
+}
+
+static long gunyah_vm_rm_function_instance(struct gunyah_vm *ghvm,
+					   struct gunyah_fn_desc *f)
+{
+	struct gunyah_vm_function_instance *inst, *iter;
+	void __user *user_argp;
+	void *argp __free(kfree) = NULL;
+	long r = 0;
+
+	if (f->arg_size) {
+		argp = kzalloc(f->arg_size, GFP_KERNEL);
+		if (!argp)
+			return -ENOMEM;
+
+		user_argp = u64_to_user_ptr(f->arg);
+		if (copy_from_user(argp, user_argp, f->arg_size))
+			return -EFAULT;
+	}
+
+	r = mutex_lock_interruptible(&ghvm->fn_lock);
+	if (r)
+		return r;
+
+	r = -ENOENT;
+	list_for_each_entry_safe(inst, iter, &ghvm->functions, vm_list) {
+		if (inst->fn->type == f->type &&
+		    inst->fn->compare(inst, argp, f->arg_size)) {
+			gunyah_vm_remove_function_instance(inst);
+			r = 0;
+		}
+	}
+
+	mutex_unlock(&ghvm->fn_lock);
+	return r;
+}
+
+int gunyah_vm_function_register(struct gunyah_vm_function *fn)
+{
+	if (!fn->bind || !fn->unbind)
+		return -EINVAL;
+
+	return xa_err(xa_store(&gunyah_vm_functions, fn->type, fn, GFP_KERNEL));
+}
+EXPORT_SYMBOL_GPL(gunyah_vm_function_register);
+
+void gunyah_vm_function_unregister(struct gunyah_vm_function *fn)
+{
+	/* Expecting unregister to only come when unloading a module */
+	WARN_ON(fn->mod && module_refcount(fn->mod));
+	xa_erase(&gunyah_vm_functions, fn->type);
+}
+EXPORT_SYMBOL_GPL(gunyah_vm_function_unregister);
+
 int gunyah_vm_add_resource_ticket(struct gunyah_vm *ghvm,
 				  struct gunyah_vm_resource_ticket *ticket)
 {
@@ -191,7 +351,11 @@ static __must_check struct gunyah_vm *gunyah_vm_alloc(struct gunyah_rm *rm)
 
 	init_rwsem(&ghvm->status_lock);
 	init_waitqueue_head(&ghvm->vm_status_wait);
+	kref_init(&ghvm->kref);
 	ghvm->vm_status = GUNYAH_RM_VM_STATUS_NO_STATE;
+
+	INIT_LIST_HEAD(&ghvm->functions);
+	mutex_init(&ghvm->fn_lock);
 	mutex_init(&ghvm->resources_lock);
 	INIT_LIST_HEAD(&ghvm->resources);
 	INIT_LIST_HEAD(&ghvm->resource_tickets);
@@ -306,6 +470,7 @@ static long gunyah_vm_ioctl(struct file *filp, unsigned int cmd,
 			    unsigned long arg)
 {
 	struct gunyah_vm *ghvm = filp->private_data;
+	void __user *argp = (void __user *)arg;
 	long r;
 
 	switch (cmd) {
@@ -313,6 +478,24 @@ static long gunyah_vm_ioctl(struct file *filp, unsigned int cmd,
 		r = gunyah_vm_ensure_started(ghvm);
 		break;
 	}
+	case GUNYAH_VM_ADD_FUNCTION: {
+		struct gunyah_fn_desc f;
+
+		if (copy_from_user(&f, argp, sizeof(f)))
+			return -EFAULT;
+
+		r = gunyah_vm_add_function_instance(ghvm, &f);
+		break;
+	}
+	case GUNYAH_VM_REMOVE_FUNCTION: {
+		struct gunyah_fn_desc f;
+
+		if (copy_from_user(&f, argp, sizeof(f)))
+			return -EFAULT;
+
+		r = gunyah_vm_rm_function_instance(ghvm, &f);
+		break;
+	}
 	default:
 		r = -ENOTTY;
 		break;
@@ -321,9 +504,15 @@ static long gunyah_vm_ioctl(struct file *filp, unsigned int cmd,
 	return r;
 }
 
-static int gunyah_vm_release(struct inode *inode, struct file *filp)
+int __must_check gunyah_vm_get(struct gunyah_vm *ghvm)
 {
-	struct gunyah_vm *ghvm = filp->private_data;
+	return kref_get_unless_zero(&ghvm->kref);
+}
+EXPORT_SYMBOL_GPL(gunyah_vm_get);
+
+static void _gunyah_vm_put(struct kref *kref)
+{
+	struct gunyah_vm *ghvm = container_of(kref, struct gunyah_vm, kref);
 	int ret;
 
 	/**
@@ -333,6 +522,7 @@ static int gunyah_vm_release(struct inode *inode, struct file *filp)
 	if (ghvm->vm_status == GUNYAH_RM_VM_STATUS_RUNNING)
 		gunyah_vm_stop(ghvm);
 
+	gunyah_vm_remove_functions(ghvm);
 	gunyah_vm_clean_resources(ghvm);
 
 	if (ghvm->vm_status != GUNYAH_RM_VM_STATUS_NO_STATE &&
@@ -357,6 +547,19 @@ static int gunyah_vm_release(struct inode *inode, struct file *filp)
 
 	gunyah_rm_put(ghvm->rm);
 	kfree(ghvm);
+}
+
+void gunyah_vm_put(struct gunyah_vm *ghvm)
+{
+	kref_put(&ghvm->kref, _gunyah_vm_put);
+}
+EXPORT_SYMBOL_GPL(gunyah_vm_put);
+
+static int gunyah_vm_release(struct inode *inode, struct file *filp)
+{
+	struct gunyah_vm *ghvm = filp->private_data;
+
+	gunyah_vm_put(ghvm);
 	return 0;
 }
 
diff --git a/drivers/virt/gunyah/vm_mgr.h b/drivers/virt/gunyah/vm_mgr.h
index 0d291f722885..190a95ee8da6 100644
--- a/drivers/virt/gunyah/vm_mgr.h
+++ b/drivers/virt/gunyah/vm_mgr.h
@@ -7,6 +7,8 @@
 #define _GUNYAH_VM_MGR_PRIV_H
 
 #include <linux/device.h>
+#include <linux/kref.h>
+#include <linux/mutex.h>
 #include <linux/rwsem.h>
 #include <linux/wait.h>
 
@@ -26,6 +28,10 @@ long gunyah_dev_vm_mgr_ioctl(struct gunyah_rm *rm, unsigned int cmd,
  * @vm_status: Current state of the VM, as last reported by RM
  * @vm_status_wait: Wait queue for status @vm_status changes
  * @status_lock: Serializing state transitions
+ * @kref: Reference counter for VM functions
+ * @fn_lock: Serialization addition of functions
+ * @functions: List of &struct gunyah_vm_function_instance that have been
+ *             created by user for this VM.
  * @resource_lock: Serializing addition of resources and resource tickets
  * @resources: List of &struct gunyah_resource that are associated with this VM
  * @resource_tickets: List of &struct gunyah_vm_resource_ticket
@@ -42,6 +48,10 @@ struct gunyah_vm {
 	enum gunyah_rm_vm_status vm_status;
 	wait_queue_head_t vm_status_wait;
 	struct rw_semaphore status_lock;
+
+	struct kref kref;
+	struct mutex fn_lock;
+	struct list_head functions;
 	struct mutex resources_lock;
 	struct list_head resources;
 	struct list_head resource_tickets;
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 001769100260..359cd63b4938 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -11,8 +11,93 @@
 #include <linux/interrupt.h>
 #include <linux/limits.h>
 #include <linux/list.h>
+#include <linux/mod_devicetable.h>
 #include <linux/types.h>
 
+#include <uapi/linux/gunyah.h>
+
+struct gunyah_vm;
+
+int __must_check gunyah_vm_get(struct gunyah_vm *ghvm);
+void gunyah_vm_put(struct gunyah_vm *ghvm);
+
+struct gunyah_vm_function_instance;
+/**
+ * struct gunyah_vm_function - Represents a function type
+ * @type: value from &enum gunyah_fn_type
+ * @name: friendly name for debug purposes
+ * @mod: owner of the function type
+ * @bind: Called when a new function of this type has been allocated.
+ * @unbind: Called when the function instance is being destroyed.
+ * @compare: Compare function instance @f's argument to the provided arg.
+ *           Return true if they are equivalent. Used on GUNYAH_VM_REMOVE_FUNCTION.
+ */
+struct gunyah_vm_function {
+	u32 type;
+	const char *name;
+	struct module *mod;
+	long (*bind)(struct gunyah_vm_function_instance *f);
+	void (*unbind)(struct gunyah_vm_function_instance *f);
+	bool (*compare)(const struct gunyah_vm_function_instance *f,
+			const void *arg, size_t size);
+};
+
+/**
+ * struct gunyah_vm_function_instance - Represents one function instance
+ * @arg_size: size of user argument
+ * @argp: pointer to user argument
+ * @ghvm: Pointer to VM instance
+ * @rm: Pointer to resource manager for the VM instance
+ * @fn: The ops for the function
+ * @data: Private data for function
+ * @vm_list: for gunyah_vm's functions list
+ * @fn_list: for gunyah_vm_function's instances list
+ */
+struct gunyah_vm_function_instance {
+	size_t arg_size;
+	void *argp;
+	struct gunyah_vm *ghvm;
+	struct gunyah_rm *rm;
+	struct gunyah_vm_function *fn;
+	void *data;
+	struct list_head vm_list;
+};
+
+int gunyah_vm_function_register(struct gunyah_vm_function *f);
+void gunyah_vm_function_unregister(struct gunyah_vm_function *f);
+
+/* Since the function identifiers were setup in a uapi header as an
+ * enum and we do no want to change that, the user must supply the expanded
+ * constant as well and the compiler checks they are the same.
+ * See also MODULE_ALIAS_RDMA_NETLINK.
+ */
+#define MODULE_ALIAS_GUNYAH_VM_FUNCTION(_type, _idx)        \
+	static inline void __maybe_unused __chk##_idx(void) \
+	{                                                   \
+		BUILD_BUG_ON(_type != _idx);                \
+	}                                                   \
+	MODULE_ALIAS("ghfunc:" __stringify(_idx))
+
+#define DECLARE_GUNYAH_VM_FUNCTION(_name, _type, _bind, _unbind, _compare) \
+	static struct gunyah_vm_function _name = {                         \
+		.type = _type,                                             \
+		.name = __stringify(_name),                                \
+		.mod = THIS_MODULE,                                        \
+		.bind = _bind,                                             \
+		.unbind = _unbind,                                         \
+		.compare = _compare,                                       \
+	}
+
+#define module_gunyah_vm_function(__gf)                  \
+	module_driver(__gf, gunyah_vm_function_register, \
+		      gunyah_vm_function_unregister)
+
+#define DECLARE_GUNYAH_VM_FUNCTION_INIT(_name, _type, _idx, _bind, _unbind, \
+					_compare)                           \
+	DECLARE_GUNYAH_VM_FUNCTION(_name, _type, _bind, _unbind, _compare); \
+	module_gunyah_vm_function(_name);                                   \
+	MODULE_ALIAS_GUNYAH_VM_FUNCTION(_type, _idx)
+
 /* Matches resource manager's resource types for VM_GET_HYP_RESOURCES RPC */
 enum gunyah_resource_type {
 	/* clang-format off */
@@ -35,8 +120,6 @@ struct gunyah_resource {
 	u32 rm_label;
 };
 
-struct gunyah_vm;
-
 /**
  * struct gunyah_vm_resource_ticket - Represents a ticket to reserve access to VM resource(s)
  * @vm_list: for @gunyah_vm->resource_tickets
diff --git a/include/uapi/linux/gunyah.h b/include/uapi/linux/gunyah.h
index 31e7f79a6c39..1b7cb5fde70a 100644
--- a/include/uapi/linux/gunyah.h
+++ b/include/uapi/linux/gunyah.h
@@ -25,4 +25,22 @@
  */
 #define GUNYAH_VM_START		_IO(GUNYAH_IOCTL_TYPE, 0x3)
 
+#define GUNYAH_FN_MAX_ARG_SIZE		256
+
+/**
+ * struct gunyah_fn_desc - Arguments to create a VM function
+ * @type: Type of the function. See &enum gunyah_fn_type.
+ * @arg_size: Size of argument to pass to the function. arg_size <= GUNYAH_FN_MAX_ARG_SIZE
+ * @arg: Pointer to argument given to the function. See &enum gunyah_fn_type for expected
+ *       arguments for a function type.
+ */
+struct gunyah_fn_desc {
+	__u32 type;
+	__u32 arg_size;
+	__u64 arg;
+};
+
+#define GUNYAH_VM_ADD_FUNCTION	_IOW(GUNYAH_IOCTL_TYPE, 0x4, struct gunyah_fn_desc)
+#define GUNYAH_VM_REMOVE_FUNCTION	_IOW(GUNYAH_IOCTL_TYPE, 0x7, struct gunyah_fn_desc)
+
 #endif

-- 
2.34.1


