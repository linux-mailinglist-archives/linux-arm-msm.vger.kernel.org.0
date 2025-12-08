Return-Path: <linux-arm-msm+bounces-84682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5041BCAD7D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 15:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BF0C30B0A41
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 14:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6E7324707;
	Mon,  8 Dec 2025 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WzaAR94P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PiO2YsDV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AF03246F5
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765203928; cv=none; b=Uf32alauPwbtYhcxvwqzvWr+d8NDnd2YU/Ol9u4rbYL8Pvc7ndwubS7FnJSdYPt5eJJX7NjhZj7vIMcCG+7IGBwT2qR6P+LwqY6EE62SwoaoV/SZtQ+8fN/SMLki2sPwQ+rXAjWlDTJMQEYWsH3Nec2GDHjMlT2otQwKamfwh2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765203928; c=relaxed/simple;
	bh=Ppw7wRM0wBbCaPjd5el6qk76FQRh20pkumuSo/hRLdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqObML35Ek5SibtEwm+qiGDsAEzrHOmnBKeWd44+MDAvVjZZA+/cCgQPNW3ucqyt74sl5rhmdF2ftaCs8OWUL4j5PxKGJlASHU4Pdua2e5Q0l2F51haYWfIqG4lb6UAOM+n3pcr5Mjh0xEIeD8e+5YMzxw/v3LdjofahkSm+DzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WzaAR94P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PiO2YsDV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8ChxwL851250
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 14:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+uTeFMrSmVdakec7XKSAsdwj
	aXaP4GIsMmUDOx/E8zo=; b=WzaAR94PXKkc8MoeLR3U+qtnluuyRHlZ624/n/s9
	xt1G/rLr5S11curKRTf6wec1I+kBhCQvPk34x0f8fPpLyPB7OKHznVgyNUpSA6Xb
	9q/NFuSaWH7xE6APgbKU05qcHMun5iPI20N8zcgaUGi4GNDrjqbCFCv+aexgH36s
	ChWf+m7d79r9iJ08D7ha7bwyFGSYtSlG85hG0cqg0f4ZjayUHjkDZylthc2FFoKo
	gvcbgwkiWSTSbslYPQyJP3gxuQAsPU8W4gr9cRLpjp4t8LQFXHw9FZwFrbcOSofc
	EufFvhUWx8lwDSVtWgpdUPr6al+8LI7M7I60euHIZ2xdmQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awxxc08mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 14:25:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2958a134514so21855855ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 06:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765203925; x=1765808725; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+uTeFMrSmVdakec7XKSAsdwjaXaP4GIsMmUDOx/E8zo=;
        b=PiO2YsDVpD1vNdRInfhKUZZx8txAZK2vrV+hdaOu2XMyY5i/nsh5RotVoI347NWfWf
         iiCwlYNo9IVi/O+AGCKhkMd1tteW+Em1jEFZSMzVtCErXPRtuQDSB1rWGbRaKbLVG7GI
         ZQrQOOLT4NXh8qIS+Tk8kK8SXqLrTxRvp+OQd7L3xbSMBFkGoRdaz605GP6kBzhpdM6Z
         qndtfBsYx4arXde3HAfYHMaK3C2M4tH+VmjB/xo0/H01/JSRXcKBxkLAwXqslm2HIQSh
         xC4aDtzt7DHFNyiN3woABk8qLQtupdEhFt5VJ8p6ygTfGGMy9qk2YgAVortw/b7Uvdf+
         jGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203925; x=1765808725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uTeFMrSmVdakec7XKSAsdwjaXaP4GIsMmUDOx/E8zo=;
        b=kp4XKESPgZkagYqrUKfPNYDY+r2dpLspazYjIQ5VgNW8WyB1Sc/9iRWLcBiWt0n6tL
         vX2TH9RbfR8srNwj77WVR565LFRuxwXS30PWqWBiz5D4dhreOmEOveYhaFAM756DrvhZ
         /b1gNGef6pM4rByN5sEai059qxy3rI4mp3eSEBSTQTzHZtLk2jsymcZ/jF7X2aCjffWt
         fx+DuWczvC8es89GeDgglBQjGFBIbzQ890klz01QT5NPZH44+FncZniNr0hC1+stXaQd
         WRLZcK2JX00teJ8spwOz5+5mprbo0jVc0aARKMLK1rS/L1nq30GQatvr+H8+L6cMC14S
         1tvw==
X-Forwarded-Encrypted: i=1; AJvYcCUEldQASN/7pgG8jZy3RL7ihi1minBk/sFt0TyrJrKvgroDN/TLWXy2K/QtCYcqTRaxFbN0ftMya50Aguj5@vger.kernel.org
X-Gm-Message-State: AOJu0Yya0wUd4R01Q+6a0zjto/ibZIG53Nigbs/Az/JN/+sJXMlzGq+E
	mqqbVOe+zeH8+jIYu3O31EfnlN0uoGa0Nh3g7TWNTOidG9sL5scA4mKukaNd2fTIkjWHX0vTflQ
	SEiS7iKRmUKx7un5HQ3lRKNh8z98w+rdMq8b2TP2V0ldVyxnguMn6UW4g73/OsNIsZWgC
X-Gm-Gg: ASbGncuhN9H+FSUdWD6n3IGdyT1zS53f7nsfBj/668UzvOJsNKBm2UPH5YqxzufQidx
	+KdOz1yidGyoVHewNNWbe93zuRG9a9j4RZR6BcLSce1imTRkgSmdpmI8kKg06bPsjGhoeJmi2V0
	1QaVV3P2CfIhXdYlZIaE7Xu8k3CQm0sgkDV5jv6SsOPdK2nemJ11FPQdmy10EKpkTKwMp/EsTp7
	R0p5GBJrcoCyCBIyl/MhhQ6KTJPYzLS2ubMftCdCj+fejlxZF1t62H6vQCvAhOxvk5yt0sIH5H0
	XszmolNH6omaIDT/p0D7OFX0ZuDgEa1qD2Gz0KWdXxlFOkgJ9O199iSg7GZ2kVjJj9CKFehWeyh
	5ELp/M/Boq7KKFLoX0MBei2sU6AlWPDOAK4eS
X-Received: by 2002:a17:902:e950:b0:295:3f35:a312 with SMTP id d9443c01a7336-29df5abdf36mr54824375ad.20.1765203924572;
        Mon, 08 Dec 2025 06:25:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLusxfrDXiXne5FSC3yqKkWrlHG22BZERr/Fi6paq2FhLIFr4DrT058tbCaXaTlMtOavPBdw==
X-Received: by 2002:a17:902:e950:b0:295:3f35:a312 with SMTP id d9443c01a7336-29df5abdf36mr54823985ad.20.1765203923826;
        Mon, 08 Dec 2025 06:25:23 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf97fsm126735465ad.25.2025.12.08.06.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:25:23 -0800 (PST)
Date: Mon, 8 Dec 2025 19:55:17 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Message-ID: <20251208142517.wdve2btbcvn2dmq3@hu-mojha-hyd.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-11-8e8e9fb0eca0@oss.qualcomm.com>
 <86f3cb9f-e42d-40f9-9103-1a4953c66c71@oss.qualcomm.com>
 <20251124152538.wt3kzztqmpr76hsx@hu-mojha-hyd.qualcomm.com>
 <p3t7ggu7wg74knfa4x6kauelfalgi6yx7xdgsoemwekpzogetg@a7xwv2s3zxmw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <p3t7ggu7wg74knfa4x6kauelfalgi6yx7xdgsoemwekpzogetg@a7xwv2s3zxmw>
X-Proofpoint-GUID: gdCWooMLAc3WgPZzTN41Cst2NDo-ZsIw
X-Proofpoint-ORIG-GUID: gdCWooMLAc3WgPZzTN41Cst2NDo-ZsIw
X-Authority-Analysis: v=2.4 cv=AKf9OaRj c=1 sm=1 tr=0 ts=6936dfd5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nmGXgFyiiTx6iAFQcSgA:9
 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDEyMiBTYWx0ZWRfX0qSC2CiKKTs8
 KS7NI84ewQ/ybgmBIRtzUbVsgv2D89BYtdM5frx/0juOmnmmDiYUJa5rZnqr+DvePPQ754RhVTy
 hMD/hODVJoYG6r2Pc0gwGWUUI0VFVWyLGIUAKIe+FyG5bLKk7GDsEHF97Jis+H9Vse9zei+60Za
 puTZGEiqSm/P315SfGokHOz2c1ZxEEXxJxmTH+pWXT2662Y0d35ydfZfvdk5+mdpTrosU8Q5uBr
 3RjTRIJUVkxC49Keq4Zt5F5b+BMKuQ/rUCg+4PVNJQHG5YCc5Io8/vIdlT3uEzpKUUJ/iS6wCmg
 jRUQUl0m7JXwqTWM0E/S36TT+EsIB3YHdFT4fAt9tL1By/pB86/19nHQQycW7wch1PjwopCv4Kv
 JnIKUt226DcPZhYrRT4k7zhAaPFdPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080122

On Fri, Dec 05, 2025 at 04:21:07PM -0600, Bjorn Andersson wrote:
> On Mon, Nov 24, 2025 at 08:55:38PM +0530, Mukesh Ojha wrote:
> > On Mon, Nov 24, 2025 at 12:48:31PM +0100, Konrad Dybcio wrote:
> > > On 11/21/25 12:01 PM, Mukesh Ojha wrote:
> > > > Qualcomm remote processor may rely on Static and Dynamic resources for
> > > > it to be functional. Static resources are fixed like for example,
> > > > memory-mapped addresses required by the subsystem and dynamic
> > > > resources, such as shared memory in DDR etc., are determined at
> > > > runtime during the boot process.
> > > > 
> > > > For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
> > > > hypervisor, all the resources whether it is static or dynamic, is
> > > > managed by the hypervisor. Dynamic resources if it is present for a
> > > > remote processor will always be coming from secure world via SMC call
> > > > while static resources may be present in remote processor firmware
> > > > binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
> > > > with dynamic resources.
> > > > 
> > > > Some of the remote processor drivers, such as video, GPU, IPA, etc., do
> > > > not check whether resources are present in their remote processor
> > > > firmware binary. In such cases, the caller of this function should set
> > > > input_rt and input_rt_size as NULL and zero respectively. Remoteproc
> > > > framework has method to check whether firmware binary contain resources
> > > > or not and they should be pass resource table pointer to input_rt and
> > > > resource table size to input_rt_size and this will be forwarded to
> > > > TrustZone for authentication. TrustZone will then append the dynamic
> > > > resources and return the complete resource table in output_rt
> > > > 
> > > > More about documentation on resource table format can be found in
> > > > include/linux/remoteproc.h
> > > > 
> > > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > > ---
> > > 
> > > [...]
> > > 
> > > > +int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
> > > > +			       size_t input_rt_size, void **output_rt,
> > > > +			       size_t *output_rt_size)
> > > > +{
> > > > +	unsigned int retry_num = 5;
> > > > +	int ret;
> > > > +
> > > > +	do {
> > > > +		*output_rt = kzalloc(*output_rt_size, GFP_KERNEL);
> > > > +		if (!*output_rt)
> > > > +			return -ENOMEM;
> > > > +
> > > > +		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt,
> > > > +						   input_rt_size, output_rt,
> > > > +						   output_rt_size);
> > > > +		if (ret)
> > > > +			kfree(*output_rt);
> > > > +
> > > > +	} while (ret == -EAGAIN && --retry_num);
> > > 
> > > Will firmware return -EAGAIN as a result, or is this to handle the
> > > "buffer too small case"?
> > 
> > The latter one where a re-attempt could pass..
> > 
> 
> But why would we need more than 1 retry here? In what cases do we expect
> that the first attempt is too small, and then the next 4 attempts are
> also going to be too small?
> 
> Why is 5 a good number?

This was a misunderstanding, will fix it as per latest discussion.

-- 
-Mukesh Ojha

