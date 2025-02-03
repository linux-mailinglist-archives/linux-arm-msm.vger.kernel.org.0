Return-Path: <linux-arm-msm+bounces-46741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 617D6A259A9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 13:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0BF4163607
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 12:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E16D2040A6;
	Mon,  3 Feb 2025 12:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ObebSxo2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306461FECD2;
	Mon,  3 Feb 2025 12:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586732; cv=none; b=f1PXCwR4E3brPpYdzM5MkFZTENEL2b405jIA8/0PcqZDjcM7MuzCcQRpgrwnFfWqp1WFNoYlTZOJ9m3zcL3wsmHIksGaBHaa6UHtir1yXmy8GbWxJCvYewH7SjFS6hXa5fzD2Kd12p9AAIrzxImxsy2ULFFjFXJa9fPwiUU2VMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586732; c=relaxed/simple;
	bh=kHQz+kiGsdIFSGfVtAa3irrxf6hBDbNySIDKr/dXYvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1VA5MfakTffxMlxGcYA/uNhvH7K19bjDS1XyeaHlXoWAyhaBf0ryxu6wxDCf8xCvjPkry8v+IKb9p6qQlip12z6GFcqpSxXAA22Zl0JbqZnoDRYysakYiejIh7TXuEiIBOHpF+uf8sdjYSxoUMLceZXkPMNbJ91XfyPevu5vwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ObebSxo2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738586731; x=1770122731;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kHQz+kiGsdIFSGfVtAa3irrxf6hBDbNySIDKr/dXYvY=;
  b=ObebSxo2sMoXRUte5ZGY9Y6Fkg8q6bw3GxmAb8vtxiepFnScsoO6IBt7
   1TjtsMiMW57LrT/CmyDkK5lppQjJNiYh2dOq/b/1zGO/imcXaVTDC9zK/
   pxmV1k0EEbTofHHD0WNp7ojK8p3XFjxXcFVxLMIbwxgpGIQ3MaDHSVLSD
   qLXLUGx7HnCDcC9pu9i8QL7tLQYFnCVaxJEPb5LVEfHqswrLY6H+VsHjT
   VmkGYkCBlFMWRQJavClMCSRckb3JwiIjIlj7sXi4/3Q/BTUa7zhXsqCTe
   8SHXuoenC6jUcREC2itSTe7OaRfPrj82NFDq6wpErRAH2GnPKi790jwOp
   A==;
X-CSE-ConnectionGUID: RNUpxaEkRpeFbVuVms/Sgg==
X-CSE-MsgGUID: WE6HYHpdQPGkZ6G9k6Tbeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50463707"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="50463707"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:45:25 -0800
X-CSE-ConnectionGUID: a+bKjDY1TxWo1YXr78FTEw==
X-CSE-MsgGUID: Pxbg7ok2R+6gTG4x+/A7hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110035977"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 04:45:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tevpF-000qup-1N;
	Mon, 03 Feb 2025 12:45:17 +0000
Date: Mon, 3 Feb 2025 20:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Subject: Re: [PATCH v2 6/8] tee: add Qualcomm TEE driver
Message-ID: <202502032035.o5DxD10H-lkp@intel.com>
References: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-6-297eacd0d34f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-6-297eacd0d34f@quicinc.com>

Hi Amirreza,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dab2734f8e9ecba609d66d1dd087a392a7774c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250203-104846
base:   dab2734f8e9ecba609d66d1dd087a392a7774c04
patch link:    https://lore.kernel.org/r/20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-6-297eacd0d34f%40quicinc.com
patch subject: [PATCH v2 6/8] tee: add Qualcomm TEE driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250203/202502032035.o5DxD10H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502032035.o5DxD10H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502032035.o5DxD10H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tee/qcomtee/call.c: In function 'qcomtee_object_invoke':
   drivers/tee/qcomtee/call.c:419:16: error: cleanup argument not a function
     419 |         struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/qcomtee/call.c:421:16: error: cleanup argument not a function
     421 |         struct qcomtee_arg *u __free(kfree) = NULL;
         |                ^~~~~~~~~~~
   drivers/tee/qcomtee/call.c:439:15: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
     439 |         oic = kzalloc(sizeof(*oic), GFP_KERNEL);
         |               ^~~~~~~
>> drivers/tee/qcomtee/call.c:439:13: warning: assignment to 'struct qcomtee_object_invoke_ctx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     439 |         oic = kzalloc(sizeof(*oic), GFP_KERNEL);
         |             ^
   drivers/tee/qcomtee/call.c:444:13: error: implicit declaration of function 'kcalloc' [-Werror=implicit-function-declaration]
     444 |         u = kcalloc(arg->num_params + 1, sizeof(*u), GFP_KERNEL);
         |             ^~~~~~~
>> drivers/tee/qcomtee/call.c:444:11: warning: assignment to 'struct qcomtee_arg *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     444 |         u = kcalloc(arg->num_params + 1, sizeof(*u), GFP_KERNEL);
         |           ^
   drivers/tee/qcomtee/call.c: In function 'qcomtee_open':
   drivers/tee/qcomtee/call.c:584:16: error: cleanup argument not a function
     584 |         struct qcomtee_context_data *ctxdata __free(kfree) = NULL;
         |                ^~~~~~~~~~~~~~~~~~~~
>> drivers/tee/qcomtee/call.c:586:17: warning: assignment to 'struct qcomtee_context_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     586 |         ctxdata = kzalloc(sizeof(*ctxdata), GFP_KERNEL);
         |                 ^
   drivers/tee/qcomtee/call.c: In function 'qcomtee_release':
   drivers/tee/qcomtee/call.c:623:9: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
     623 |         kfree(ctxdata);
         |         ^~~~~
   drivers/tee/qcomtee/call.c: In function 'qcomtee_probe':
   drivers/tee/qcomtee/call.c:655:16: error: cleanup argument not a function
     655 |         struct qcomtee *qcomtee __free(kfree) = NULL;
         |                ^~~~~~~
>> drivers/tee/qcomtee/call.c:659:17: warning: assignment to 'struct qcomtee *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     659 |         qcomtee = kzalloc(sizeof(*qcomtee), GFP_KERNEL);
         |                 ^
   cc1: some warnings being treated as errors
--
   drivers/tee/qcomtee/core.c: In function 'qcomtee_object_alloc':
   drivers/tee/qcomtee/core.c:51:18: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
      51 |         object = kzalloc(sizeof(*object), GFP_KERNEL);
         |                  ^~~~~~~
>> drivers/tee/qcomtee/core.c:51:16: warning: assignment to 'struct qcomtee_object *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      51 |         object = kzalloc(sizeof(*object), GFP_KERNEL);
         |                ^
   drivers/tee/qcomtee/core.c: In function 'qcomtee_object_free':
   drivers/tee/qcomtee/core.c:62:9: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
      62 |         kfree(object->name);
         |         ^~~~~
   drivers/tee/qcomtee/core.c: In function 'qcomtee_object_user_init':
   drivers/tee/qcomtee/core.c:249:17: warning: function 'qcomtee_object_user_init' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     249 |                 object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |                 ^~~~~~
   drivers/tee/qcomtee/core.c: In function 'qcomtee_prepare_msg':
   drivers/tee/qcomtee/core.c:378:26: error: implicit declaration of function 'copy_from_user' [-Werror=implicit-function-declaration]
     378 |                 else if (copy_from_user(ptr, u[i].b.uaddr, u[i].b.size))
         |                          ^~~~~~~~~~~~~~
   drivers/tee/qcomtee/core.c: In function 'qcomtee_update_args':
   drivers/tee/qcomtee/core.c:458:26: error: implicit declaration of function 'copy_to_user' [-Werror=implicit-function-declaration]
     458 |                 else if (copy_to_user(u[i].b.uaddr, ptr, u[i].b.size))
         |                          ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/tee/qcomtee/user_obj.c: In function 'qcomtee_requests_destroy':
   drivers/tee/qcomtee/user_obj.c:238:25: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
     238 |                         kfree(ureq);
         |                         ^~~~~
   drivers/tee/qcomtee/user_obj.c: In function 'qcomtee_user_object_dispatch':
   drivers/tee/qcomtee/user_obj.c:252:16: error: cleanup argument not a function
     252 |         struct qcomtee_ureq *ureq __free(kfree) = NULL;
         |                ^~~~~~~~~~~~
   drivers/tee/qcomtee/user_obj.c:255:16: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
     255 |         ureq = kzalloc(sizeof(*ureq), GFP_KERNEL);
         |                ^~~~~~~
>> drivers/tee/qcomtee/user_obj.c:255:14: warning: assignment to 'struct qcomtee_ureq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     255 |         ureq = kzalloc(sizeof(*ureq), GFP_KERNEL);
         |              ^
   drivers/tee/qcomtee/user_obj.c: In function 'qcomtee_user_object_release':
   drivers/tee/qcomtee/user_obj.c:352:14: warning: assignment to 'struct qcomtee_ureq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     352 |         ureq = kzalloc(sizeof(*ureq), GFP_KERNEL);
         |              ^
   drivers/tee/qcomtee/user_obj.c: In function 'qcomtee_user_param_to_object':
   drivers/tee/qcomtee/user_obj.c:394:16: error: cleanup argument not a function
     394 |         struct qcomtee_user_object *user_object __free(kfree) = NULL;
         |                ^~~~~~~~~~~~~~~~~~~
>> drivers/tee/qcomtee/user_obj.c:398:21: warning: assignment to 'struct qcomtee_user_object *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     398 |         user_object = kzalloc(sizeof(*user_object), GFP_KERNEL);
         |                     ^
   drivers/tee/qcomtee/user_obj.c: In function 'qcomtee_cb_params_from_args':
   drivers/tee/qcomtee/user_obj.c:484:29: error: implicit declaration of function 'copy_to_user' [-Werror=implicit-function-declaration]
     484 |                         if (copy_to_user(params[i].u.ubuf.uaddr, u[i].b.addr,
         |                             ^~~~~~~~~~~~
   drivers/tee/qcomtee/user_obj.c: In function 'qcomtee_cb_params_to_args':
   drivers/tee/qcomtee/user_obj.c:561:29: error: implicit declaration of function 'copy_from_user' [-Werror=implicit-function-declaration]
     561 |                         if (copy_from_user(u[i].b.addr, params[i].u.ubuf.uaddr,
         |                             ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +439 drivers/tee/qcomtee/call.c

   406	
   407	/**
   408	 * qcomtee_object_invoke() - Invoke a QTEE object.
   409	 * @ctx: TEE context.
   410	 * @arg: ioctl arguments.
   411	 * @params: parameters for the object.
   412	 *
   413	 * Return: On success, returns 0; on failure, returns < 0.
   414	 */
   415	static int qcomtee_object_invoke(struct tee_context *ctx,
   416					 struct tee_ioctl_object_invoke_arg *arg,
   417					 struct tee_param *params)
   418	{
 > 419		struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
   420		struct qcomtee_context_data *ctxdata = ctx->data;
   421		struct qcomtee_arg *u __free(kfree) = NULL;
   422		struct qcomtee_object *object;
   423		int i, ret, result;
   424	
   425		if (qcomtee_params_check(params, arg->num_params))
   426			return -EINVAL;
   427	
   428		/* First, handle reserved operations: */
   429		if (arg->op == QCOMTEE_OBJREF_OP_RELEASE) {
   430			del_qtee_object(arg->object, ctxdata);
   431	
   432			return 0;
   433		} else if (arg->op > QCOMTEE_OBJREF_OP_MIN) {
   434			return -EINVAL;
   435		}
   436	
   437		/* Otherwise, invoke a QTEE object: */
   438	
 > 439		oic = kzalloc(sizeof(*oic), GFP_KERNEL);
   440		if (!oic)
   441			return -ENOMEM;
   442	
   443		/* +1 for ending QCOMTEE_ARG_TYPE_INV. */
 > 444		u = kcalloc(arg->num_params + 1, sizeof(*u), GFP_KERNEL);
   445		if (!u)
   446			return -ENOMEM;
   447	
   448		/* Get an object to invoke. */
   449		if (arg->object == TEE_OBJREF_NULL) {
   450			/* Use ROOT if TEE_OBJREF_NULL is invoked. */
   451			if (qcomtee_root_object_check(arg->op, params, arg->num_params))
   452				return -EINVAL;
   453	
   454			object = ROOT_QCOMTEE_OBJECT;
   455		} else if (find_qtee_object(&object, arg->object, ctxdata)) {
   456			return -EINVAL;
   457		}
   458	
   459		ret = qcomtee_params_to_args(u, params, arg->num_params, ctx);
   460		if (ret)
   461			goto out;
   462	
   463		ret = qcomtee_object_do_invoke(oic, object, arg->op, u, &result);
   464		if (ret) {
   465			qcomtee_arg_for_each_input_object(i, u) {
   466				qcomtee_user_object_set_notify(u[i].o, false);
   467				qcomtee_object_put(u[i].o);
   468			}
   469	
   470			goto out;
   471		}
   472	
   473		if (!result) {
   474			/* Assume service is UNAVAIL if unable to process the result. */
   475			if (qcomtee_params_from_args(params, u, arg->num_params, ctx))
   476				result = QCOMTEE_MSG_ERROR_UNAVAIL;
   477		} else {
   478			/*
   479			 * qcomtee_params_to_args() gets a copy of IO for the driver to
   480			 * make sure they do not get released while in the middle of
   481			 * invocation. On success (!result), qcomtee_params_from_args()
   482			 * puts them.
   483			 */
   484			qcomtee_arg_for_each_input_object(i, u)
   485				qcomtee_object_put(u[i].o);
   486		}
   487	
   488		arg->ret = result;
   489	out:
   490		qcomtee_object_put(object);
   491	
   492		return ret;
   493	}
   494	
   495	/**
   496	 * qcomtee_supp_recv() - Wait for a request for the supplicant.
   497	 * @ctx: TEE context.
   498	 * @op: requested operation on the object.
   499	 * @num_params: number of elements in the parameter array.
   500	 * @params: parameters for @op.
   501	 *
   502	 * The first parameter is a meta %TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT.
   503	 * On input, it provides a user buffer. This buffer is used for parameters of
   504	 * type %TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT in qcomtee_cb_params_from_args().
   505	 * On output, the object ID and request ID are stored in the meta parameter.
   506	 *
   507	 * @num_params is updated to the number of parameters that actually exist
   508	 * in @params on return.
   509	 *
   510	 * Return: On success, returns 0; on failure, returns < 0.
   511	 */
   512	static int qcomtee_supp_recv(struct tee_context *ctx, u32 *op, u32 *num_params,
   513				     struct tee_param *params)
   514	{
   515		struct qcomtee_user_object_request_data data;
   516		void __user *uaddr;
   517		size_t ubuf_size;
   518		int i, ret;
   519	
   520		if (!*num_params)
   521			return -EINVAL;
   522	
   523		/* We expect the first parameter to be an INOUT + meta parameter. */
   524		if (params->attr !=
   525		    (TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT | TEE_IOCTL_PARAM_ATTR_META))
   526			return -EINVAL;
   527	
   528		/* Other parameters are none. */
   529		for (i = 1; i < *num_params; i++)
   530			if (params[i].attr)
   531				return -EINVAL;
   532	
   533		if (!IS_ALIGNED(params->u.value.a, 8))
   534			return -EINVAL;
   535	
   536		/* User buffer and size from meta parameter. */
   537		uaddr = u64_to_user_ptr(params->u.value.a);
   538		ubuf_size = params->u.value.b;
   539		/* Process TEE parameters. +/-1 to ignore the meta parameter. */
   540		ret = qcomtee_user_object_select(ctx, params + 1, *num_params - 1,
   541						 uaddr, ubuf_size, &data);
   542		if (ret)
   543			return ret;
   544	
   545		params->u.value.a = data.object_id;
   546		params->u.value.b = data.id;
   547		params->u.value.c = 0;
   548		*op = data.op;
   549		*num_params = data.np + 1;
   550	
   551		return 0;
   552	}
   553	
   554	/**
   555	 * qcomtee_supp_send() - Submit a response for a request.
   556	 * @ctx: TEE context.
   557	 * @errno: return value for the request.
   558	 * @num_params: number of elements in the parameter array.
   559	 * @params: returned parameters.
   560	 *
   561	 * The first parameter is a meta %TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT.
   562	 * It specifies the request ID this response belongs to.
   563	 *
   564	 * Return: On success, returns 0; on failure, returns < 0.
   565	 */
   566	static int qcomtee_supp_send(struct tee_context *ctx, u32 errno, u32 num_params,
   567				     struct tee_param *params)
   568	{
   569		if (!num_params)
   570			return -EINVAL;
   571	
   572		/* We expect the first parameter to be an OUTPUT + meta parameter. */
   573		if (params->attr != (TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT |
   574				     TEE_IOCTL_PARAM_ATTR_META))
   575			return -EINVAL;
   576	
   577		/* Process TEE parameters. +/-1 to ignore the meta parameter. */
   578		return qcomtee_user_object_submit(ctx, params + 1, num_params - 1,
   579						  params->u.value.a, errno);
   580	}
   581	
   582	static int qcomtee_open(struct tee_context *ctx)
   583	{
   584		struct qcomtee_context_data *ctxdata __free(kfree) = NULL;
   585	
 > 586		ctxdata = kzalloc(sizeof(*ctxdata), GFP_KERNEL);
   587		if (!ctxdata)
   588			return -ENOMEM;
   589	
   590		idr_init(&ctxdata->qtee_objects_idr);
   591		spin_lock_init(&ctxdata->qtee_lock);
   592		idr_init(&ctxdata->reqs_idr);
   593		INIT_LIST_HEAD(&ctxdata->reqs_list);
   594		mutex_init(&ctxdata->reqs_lock);
   595		init_completion(&ctxdata->req_c);
   596	
   597		ctx->data = no_free_ptr(ctxdata);
   598	
   599		return 0;
   600	}
   601	
   602	/* This is called when the user closes the context. */
   603	static void qcomtee_close_context(struct tee_context *ctx)
   604	{
   605		struct qcomtee_context_data *ctxdata = ctx->data;
   606		struct qcomtee_object *object;
   607		int id;
   608	
   609		/* Process QUEUED or PROCESSING requests. */
   610		qcomtee_requests_destroy(ctxdata);
   611		/* Release QTEE objects. */
   612		idr_for_each_entry(&ctxdata->qtee_objects_idr, object, id)
   613			qcomtee_object_put(object);
   614	}
   615	
   616	/* This is called when the final reference to the context goes away. */
   617	static void qcomtee_release(struct tee_context *ctx)
   618	{
   619		struct qcomtee_context_data *ctxdata = ctx->data;
   620	
   621		idr_destroy(&ctxdata->qtee_objects_idr);
   622		idr_destroy(&ctxdata->reqs_idr);
 > 623		kfree(ctxdata);
   624	}
   625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

