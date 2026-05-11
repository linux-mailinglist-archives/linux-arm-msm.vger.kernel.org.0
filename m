Return-Path: <linux-arm-msm+bounces-106839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHQcBiBtAWqaYwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 07:46:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3D8508469
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 07:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D3C93003821
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 05:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56BC378D94;
	Mon, 11 May 2026 05:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ni8ol0Ki";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YwUkG4+Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7FC156661
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778478360; cv=none; b=AINNnZ9iWXIg2rWDegoreLXEhkQKMU63C+zkqzBMJ6T3hBiULUoLoqTKGbnbl2Y8wzXKPSZUkReBEt0FjDZoNarvZBWi2GfD/UhXg2E1TPGlb+ClckFvz4BbHXmnx4hIAwLhDsCv1pV3j2PAgvjxwz7SfK8zJcK0+EK31OU+gvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778478360; c=relaxed/simple;
	bh=OE73gjeCWH6KXRkohMZT9lAu0q55lBrI6/9Az3fPHUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nhtSymKETC05vEWa3aFR3XVrz1hcjII0HXL2p3YTa5LSsGnoJSLLc7XV6VAm5KhfbIsJ9DZTu3F4dk32TOxmwwT39v9wYIu252rDeVpUaE4BZeIZpoC9jjiIK4n2k5mXCnY5Scbpsrjb8Zz+s3d2/g2x9nog5DF8RwjXIEfajzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ni8ol0Ki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YwUkG4+Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B4WPgi2801917
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rbz2tLx6OOr+NFsFiHeMuQSLkWr4kgtUmG93B/PLu+I=; b=ni8ol0KiW6uBSwPM
	g0ch+uggGRV7aqiSxxXQPo3kESj7nOhwrrYgLTAnmfQQ5oRepncR4HqK8xzDxQkH
	4AURfrpJtvQCuLe8aBNNFSzdcuTxE1dk5+QvuZCjZVmLALsMXr/j0Wm2QgPb6aQM
	XJEOR5NL4oXpjZ6mg5V89tCUsxoVINfLwcWEIHh66YnZUbqfeo6S7NsW/91B6m6k
	X83vN1EUASb/tC/rJfT21W+GrMU2LDXcbKN6T84tGOr6Ags2gFxUvQxJUheja/zL
	XflTZJIEvM9ij4EhMp4KH5cTcFr25yWTmARAaWI2PgMVyIzltxRgk/JbYT1/1Gfr
	HzzZoQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1vgy4mqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:45:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba3245a43dso27595545ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 22:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778478355; x=1779083155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbz2tLx6OOr+NFsFiHeMuQSLkWr4kgtUmG93B/PLu+I=;
        b=YwUkG4+Ylvyyw0ogLdO705SIltqdVh62Pvbh4/QWqb2LN0o0KLAnQXuXZjtwon6Vkx
         eGcgqt1A/A72mqRzPSw6eZ3NOoqjwu6YyJGPiPqYvwDmGqZ7jDA7m/PeMNg3k9oPiDSh
         jgtVroDeOXG3xgHWyIFbZlAqdLJrfn622F+Yg1/LNn+Hw08K5GDbumtQ3U8nPDMXOj/p
         fjwWoxxH7SE3zl4pDK+DUQHBrA3w+QXzuygTIV2F0mLfrxSPQ9OOSR56Wr9ZnzH9m/XY
         5uuj1XdfGyBpJtNcHko+E9ge2AnjnxJWJm5i0uQ3m1eMz0lc4N6v+KMeiMuPg9Re26Mx
         cpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778478355; x=1779083155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbz2tLx6OOr+NFsFiHeMuQSLkWr4kgtUmG93B/PLu+I=;
        b=BEri/qBxlkLpyQTLdUycT/cssWyqmlcMQFw6YhdZyUqxMzLwYJIiB+VsnUVAmLc5kb
         KQ4lFOr3NgAbBfgxOSiPwuOVroZ7b4dS8bWYDy7dcmyudMxrK+C7vubslwor+8sle3SC
         jwzvG/nZAU8Ny/8xOlAxgWUO8eT4UPhPWxVcvbjlCCOJm0VC7kGBwgLgDE7gNymIeD79
         SizL7Al/J+5ZlPMZ12xRTN6SjVuV0ZpEa96fAVD1U7JJ1Y2ERH9D2fzjeSM73t/ggYuk
         5HHrTaJDecIj1ufjluSGAUhb9ZMhYPlVE1WnwMDcG3YEf17xl2Bk8/bUp5PxZnrW5gcc
         e7vg==
X-Forwarded-Encrypted: i=1; AFNElJ+3zkRbIfTv+f94fKUwtD22pdi02n52be8NtHNgcVA8PyBw/A5MxgNhQNo8WbzbCsHw2MknVceSVMyCrosr@vger.kernel.org
X-Gm-Message-State: AOJu0YyH7O1S1kpzIRfXwIRNsKYtM6B9egtmIbwTimbuvcESbjrIlhko
	/huU6Y4rTFsdAwadAzE+uV71/YKOPXoSoQWL7zVnoFM6Fnbgj8z/R3UXin2r98/njqW531+Zskt
	fTHa140z/wchWW+tgocMg7JYhJnuXpfgGJYbqCdfXQrPFpSUXol+CL1G8XyPjLfHKO7/h
X-Gm-Gg: Acq92OFvVOKIZBLMe2Us45yT7aTZEp7JFhvVlt48/Sj1mSBFlU+H5h7e+dQ+VGcYdae
	5tW+ENDPmMloePR5NvKLPQw7c6ZnVHafKFmIQcDaP7ussVpBufFHJ5yGEAbLl6dPE2ORuQkwfZ8
	Pkquan1r4JXterVRG6GlYfjbKqga2dUclT5FdmxAM6MkOf1dpzkxgM7ukaUKFoueEQJ+ly+wFsJ
	u5H8hAlK/HwZ7YK2Wxo/gCgcM4ImBcdpnQU1zaRnJGBs5BnLa1/jzSMSPyYkEESTBwcv8oJ+rxa
	ZtQBiNy45MLzOXnWeEZWF/R2qs2GsyrEDu17RRkrnm4sQQbSuU9lHG1Ky/za0tDc7ptnOZke6Tl
	7NblzMEg3W0LJtIxJgGwGumGIrQH4An4lw3BzEspgv7sTs1W44hbsoFBFQskQt66ccltkNS0WNl
	D/P6GRd2FbsJkuQTcZoIOColtVJBIaN26IuyzLZmpZANI=
X-Received: by 2002:a17:903:1a8c:b0:2b2:5515:661c with SMTP id d9443c01a7336-2ba794b6a31mr236073725ad.31.1778478354776;
        Sun, 10 May 2026 22:45:54 -0700 (PDT)
X-Received: by 2002:a17:903:1a8c:b0:2b2:5515:661c with SMTP id d9443c01a7336-2ba794b6a31mr236073015ad.31.1778478354101;
        Sun, 10 May 2026 22:45:54 -0700 (PDT)
Received: from [10.79.194.67] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35632sm94712655ad.53.2026.05.10.22.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 22:45:53 -0700 (PDT)
Message-ID: <17397c91-53e2-4786-b7c8-88c302821e22@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:15:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap
 <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
 <20260427-add-driver-for-ec-v8-2-702f74e495f7@oss.qualcomm.com>
 <91523c61-bd03-2d96-823e-78ecd9e3798f@linux.intel.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <91523c61-bd03-2d96-823e-78ecd9e3798f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fpHsol4f c=1 sm=1 tr=0 ts=6a016d14 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=EkMnPWZoIzirROCtt7EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: -Q8A-bX_eSzcbuc-eBb1FJgZrULkrHms
X-Proofpoint-GUID: -Q8A-bX_eSzcbuc-eBb1FJgZrULkrHms
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA1OCBTYWx0ZWRfX96vtrMT4m4c7
 rViccPCLOnrQ9ADRkAAIYS9pltdZJaxaor1XHmN9kJkDbJwfesLb7xvwGz6cJhax1gHHye3z+79
 UlGmDubbPXtJGnRigGWLB/jDX6y5PHYFMR3jn2ZgedrJc4QpDBrutoG9KiGRjmXOU46NfxazfeV
 m8i4XZrDcm0hr26cfI2sKaTx0nW198GvdGFb0si44QqWlQaFhohEjBgz/9lYktYTZeD5wd2FLxr
 FHvVyffBTd94fWiZUyVxUu0wmLmbkEArkQ89oPdSE7/9goAMUkvKFECJC5we8uBicU8iPj3eUvM
 krOROkYgDUEfZqMGaxm2vdNPE42NICdXV0LtDFbQpH9IZfzD9RLxGUa34wBycrQXLrtkUikbn+/
 ZHBKfkW9VZWfGhe+MCUJaRAOCzPN1dTXKLQIi6V4WWW6tVZSSDXS39auOA/KXnWixy898PdVEA4
 rQLM24XHpXXAJ9WU0qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110058
X-Rspamd-Queue-Id: 0A3D8508469
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,infradead.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-106839-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/8/2026 11:03 PM, Ilpo Järvinen wrote:
> On Mon, 27 Apr 2026, Anvesh Jain P wrote:
> 
>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>
>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>> reference boards. It handles fan control, temperature sensors, access
>> to EC state changes and supports reporting suspend entry/exit to the
>> EC.
> 
> Thanks, this seems mostly ready now. A few minor things still noted below.
>

Hi Ilpo,

Thanks for the review! Addressed all points below.
>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Tested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  MAINTAINERS                            |   8 +
>>  drivers/platform/arm64/Kconfig         |  13 +
>>  drivers/platform/arm64/Makefile        |   1 +
>>  drivers/platform/arm64/qcom-hamoa-ec.c | 452 +++++++++++++++++++++++++++++++++
>>  4 files changed, 474 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 62b89d0013d2..0bf0d6d55550 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21980,6 +21980,14 @@ F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>>  F:	drivers/misc/fastrpc.c
>>  F:	include/uapi/misc/fastrpc.h
>>  
>> +QUALCOMM HAMOA EMBEDDED CONTROLLER DRIVER
>> +M:	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> +M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>> +F:	drivers/platform/arm64/qcom-hamoa-ec.c
>> +
>>  QUALCOMM HEXAGON ARCHITECTURE
>>  M:	Brian Cain <brian.cain@oss.qualcomm.com>
>>  L:	linux-hexagon@vger.kernel.org
>> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
>> index 10f905d7d6bf..e32e01b2a9bd 100644
>> --- a/drivers/platform/arm64/Kconfig
>> +++ b/drivers/platform/arm64/Kconfig
>> @@ -90,4 +90,17 @@ config EC_LENOVO_THINKPAD_T14S
>>  
>>  	  Say M or Y here to include this support.
>>  
>> +config EC_QCOM_HAMOA
>> +	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
>> +	depends on ARCH_QCOM || COMPILE_TEST
>> +	depends on I2C
>> +	depends on THERMAL || THERMAL=n
>> +	help
>> +	  Say M or Y here to enable the Embedded Controller driver for Qualcomm
>> +	  Snapdragon-based Hamoa/Glymur reference devices. The driver handles fan
>> +	  control, temperature sensors, access to EC state changes and supports
>> +	  reporting suspend entry/exit to the EC.
>> +
>> +	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
>> +
>>  endif # ARM64_PLATFORM_DEVICES
>> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
>> index 60c131cff6a1..7681be4a46e9 100644
>> --- a/drivers/platform/arm64/Makefile
>> +++ b/drivers/platform/arm64/Makefile
>> @@ -9,3 +9,4 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
>>  obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>>  obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
>> +obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> new file mode 100644
>> index 000000000000..253f927c9aca
>> --- /dev/null
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>> @@ -0,0 +1,452 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>> +#include <linux/device.h>
>> +#include <linux/dev_printk.h>
>> +#include <linux/err.h>
>> +#include <linux/i2c.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/pm.h>
>> +#include <linux/slab.h>
>> +#include <linux/thermal.h>
>> +
>> +#define EC_SCI_EVT_READ_CMD	0x05
>> +#define EC_FW_VERSION_CMD	0x0e
>> +#define EC_MODERN_STANDBY_CMD	0x23
>> +#define EC_FAN_DBG_CONTROL_CMD	0x30
>> +#define EC_SCI_EVT_CONTROL_CMD	0x35
>> +#define EC_THERMAL_CAP_CMD	0x42
>> +
>> +#define EC_FW_VERSION_RESP_LEN	4
>> +#define EC_THERMAL_CAP_RESP_LEN	3
>> +#define EC_FAN_DEBUG_CMD_LEN	6
>> +#define EC_FAN_SPEED_DATA_SIZE	4
>> +
>> +#define EC_MODERN_STANDBY_ENTER	0x01
>> +#define EC_MODERN_STANDBY_EXIT	0x00
>> +
>> +#define EC_FAN_DEBUG_MODE_OFF   0
>> +#define EC_FAN_DEBUG_MODE_ON    BIT(0)
>> +#define EC_FAN_ON               BIT(1)
>> +#define EC_FAN_DEBUG_TYPE_PWM   BIT(2)
>> +#define EC_MAX_FAN_CNT		2
>> +#define EC_FAN_NAME_SIZE	20
>> +#define EC_FAN_MAX_PWM		255
>> +
>> +enum qcom_ec_sci_events {
>> +	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
>> +	EC_FAN2_STATUS_CHANGE_EVT,
>> +	EC_FAN1_SPEED_CHANGE_EVT,
>> +	EC_FAN2_SPEED_CHANGE_EVT,
>> +	EC_NEW_LUT_SET_EVT,
>> +	EC_FAN_PROFILE_SWITCH_EVT,
>> +	EC_THERMISTOR_1_THRESHOLD_CROSS_EVT,
>> +	EC_THERMISTOR_2_THRESHOLD_CROSS_EVT,
>> +	EC_THERMISTOR_3_THRESHOLD_CROSS_EVT,
>> +	/* Reserved: 0x39 - 0x3c/0x3f */
>> +	EC_RECOVERED_FROM_RESET_EVT = 0x3d,
>> +};
>> +
>> +struct qcom_ec_version {
>> +	u8 main_version;
>> +	u8 sub_version;
>> +	u8 test_version;
>> +};
>> +
>> +struct qcom_ec_thermal_cap {
>> +#define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
>> +#define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
>> +#define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
>> +	u8 fan_cnt;
>> +	u8 fan_type;
>> +	u8 thermistor_mask;
>> +};
>> +
>> +struct qcom_ec_cooling_dev {
>> +	struct thermal_cooling_device *cdev;
>> +	struct device *parent_dev;
>> +	u8 fan_id;
>> +	u8 state;
>> +};
>> +
>> +struct qcom_ec {
>> +	struct qcom_ec_cooling_dev *ec_cdev;
>> +	struct qcom_ec_thermal_cap thermal_cap;
>> +	struct qcom_ec_version version;
>> +	struct i2c_client *client;
>> +};
>> +
>> +static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>> +{
>> +	int ret;
>> +
>> +	ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
>> +
>> +	if (ret < 0)
> 
> Call and its error handling belong together so please remove the empty line.
>

Ack, will remove the blank line in the next revision.

>> +		return ret;
>> +	else if (ret == 0 || ret == 0xff)
>> +		return -EOPNOTSUPP;
>> +
>> +	if (resp[0] >= resp_len)
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * EC Device Firmware Version:
>> + *
>> + * Read Response:
>> + * ----------------------------------------------------------------------
>> + * | Offset	| Name		| Description				|
>> + * ----------------------------------------------------------------------
>> + * | 0x00	| Byte count	| Number of bytes in response		|
>> + * |		|		| (excluding byte count)		|
>> + * ----------------------------------------------------------------------
>> + * | 0x01	| Test-version	| Test-version of EC firmware		|
>> + * ----------------------------------------------------------------------
>> + * | 0x02	| Sub-version	| Sub-version of EC firmware		|
>> + * ----------------------------------------------------------------------
>> + * | 0x03	| Main-version	| Main-version of EC firmware		|
>> + * ----------------------------------------------------------------------
>> + *
>> + */
>> +static int qcom_ec_read_fw_version(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>> +	struct qcom_ec_version *version = &ec->version;
>> +	u8 resp[EC_FW_VERSION_RESP_LEN];
>> +	int ret;
>> +
>> +	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	version->main_version = resp[3];
>> +	version->sub_version = resp[2];
>> +	version->test_version = resp[1];
>> +
>> +	dev_dbg(dev, "EC Version %d.%d.%d\n",
>> +		version->main_version, version->sub_version, version->test_version);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * EC Device Thermal Capabilities:
>> + *
>> + * Read Response:
>> + * ------------------------------------------------------------------------------
>> + * | Offset		| Name		| Description				|
>> + * ------------------------------------------------------------------------------
>> + * | 0x00		| Byte count	| Number of bytes in response		|
>> + * |			|		| (excluding byte count)		|
>> + * ------------------------------------------------------------------------------
>> + * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
>> + * | 0x03		| Capabilities	| Bit 2-4: Type of fan			|
>> + * |			|		| Bit 5-6: Reserved			|
>> + * |			|		| Bit 7: Data Valid/Invalid		|
>> + * |			|		|	 (Valid - 1, Invalid - 0)	|
>> + * |			|		| Bit 8-15: Thermistor 0 - 7 presence	|
>> + * |			|		|	    (1 present, 0 absent)	|
>> + * ------------------------------------------------------------------------------
>> + *
>> + */
>> +static int qcom_ec_thermal_capabilities(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>> +	struct qcom_ec_thermal_cap *cap = &ec->thermal_cap;
>> +	u8 resp[EC_THERMAL_CAP_RESP_LEN];
>> +	int ret;
>> +
>> +	ret = qcom_ec_read(ec, EC_THERMAL_CAP_CMD, EC_THERMAL_CAP_RESP_LEN, resp);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	cap->fan_cnt = min(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
>> +	cap->fan_type = EC_THERMAL_FAN_TYPE(resp[1]);
>> +	cap->thermistor_mask = EC_THERMAL_THERMISTOR_MASK(resp[2]);
>> +
>> +	dev_dbg(dev, "Fan count: %d Fan Type: %d Thermistor Mask: %x\n",
>> +		cap->fan_cnt, cap->fan_type, cap->thermistor_mask);
>> +
>> +	return 0;
>> +}
>> +
>> +static irqreturn_t qcom_ec_irq(int irq, void *data)
>> +{
>> +	struct qcom_ec *ec = data;
>> +	struct device *dev = &ec->client->dev;
>> +	int val;
>> +
>> +	val = i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
>> +	if (val < 0) {
>> +		dev_err_ratelimited(dev, "Failed to read EC SCI Event: %d\n", val);
>> +		return IRQ_HANDLED;
>> +	}
>> +
>> +	switch (val) {
>> +	case EC_FAN1_STATUS_CHANGE_EVT:
>> +		dev_dbg_ratelimited(dev, "Fan1 status changed\n");
>> +		break;
>> +	case EC_FAN2_STATUS_CHANGE_EVT:
>> +		dev_dbg_ratelimited(dev, "Fan2 status changed\n");
>> +		break;
>> +	case EC_FAN1_SPEED_CHANGE_EVT:
>> +		dev_dbg_ratelimited(dev, "Fan1 speed crossed low/high trip point\n");
>> +		break;
>> +	case EC_FAN2_SPEED_CHANGE_EVT:
>> +		dev_dbg_ratelimited(dev, "Fan2 speed crossed low/high trip point\n");
>> +		break;
>> +	case EC_NEW_LUT_SET_EVT:
>> +		dev_dbg_ratelimited(dev, "New LUT set\n");
>> +		break;
>> +	case EC_FAN_PROFILE_SWITCH_EVT:
>> +		dev_dbg_ratelimited(dev, "FAN Profile switched\n");
>> +		break;
>> +	case EC_THERMISTOR_1_THRESHOLD_CROSS_EVT:
>> +		dev_dbg_ratelimited(dev, "Thermistor 1 threshold crossed\n");
>> +		break;
>> +	case EC_THERMISTOR_2_THRESHOLD_CROSS_EVT:
>> +		dev_dbg_ratelimited(dev, "Thermistor 2 threshold crossed\n");
>> +		break;
>> +	case EC_THERMISTOR_3_THRESHOLD_CROSS_EVT:
>> +		dev_dbg_ratelimited(dev, "Thermistor 3 threshold crossed\n");
>> +		break;
>> +	case EC_RECOVERED_FROM_RESET_EVT:
>> +		dev_dbg_ratelimited(dev, "EC recovered from reset\n");
>> +		break;
>> +	default:
>> +		dev_notice_ratelimited(dev, "Unknown EC event: %d\n", val);
>> +		break;
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +
>> +	return i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, !!enable);
> 
> This converts bool -> u8 using C's implicit conversion rules (plus on top 
> of that does unnecessary !!). Please write the conversion explicitly, you 
> can use ?: syntax for brevity.
>

The original v4 code used `enable ? 1 : 0` explicitly, but Konrad Dybcio
suggested switching to `!!enable` during his review [1]. Happy to revert
to the explicit form if that's the preferred style — just want to flag
the conflict so everyone is aligned.

[1]
https://lore.kernel.org/all/6eb3a173-c364-431f-93e4-7bbb7a32431e@oss.qualcomm.com/

>> +}
>> +
>> +static int qcom_ec_fan_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
>> +{
>> +	*state = EC_FAN_MAX_PWM;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_ec_fan_get_cur_state(struct thermal_cooling_device *cdev, unsigned long *state)
>> +{
>> +	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
>> +
>> +	*state = ec_cdev->state;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Fan Debug control command:
>> + *
>> + * Command Payload:
>> + * --------------------------------------------------------------------------------------
>> + * | Offset		| Name		| Description					|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x00		| Command	| Fan control command				|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x01		| Fan ID	| 0x1 : Fan 1					|
>> + * |			|		| 0x2 : Fan 2					|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x02		| Byte count = 4| Size of data to set fan speed			|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x03		| Mode		| Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )	|
>> + * |			|		| Bit 1: Fan On/Off (0 - Off, 1 - ON)		|
>> + * |			|		| Bit 2: Debug Type (0 - RPM, 1 - PWM)		|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x04 (LSB)	| Speed in RPM	| RPM value, if mode selected is RPM		|
>> + * | 0x05		|		|						|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x06		| Speed in PWM	| PWM value, if mode selected is PWM (0 - 255)	|
>> + * ______________________________________________________________________________________
>> + *
>> + */
>> +static int qcom_ec_fan_debug_mode_off(struct qcom_ec_cooling_dev *ec_cdev)
>> +{
>> +	struct device *dev = ec_cdev->parent_dev;
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
>> +			  EC_FAN_DEBUG_MODE_OFF, 0, 0, 0 };
>> +	int ret;
>> +
>> +	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
>> +					     sizeof(request), request);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to turn off fan%d debug mode: %d\n",
>> +			ec_cdev->fan_id, ret);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
>> +{
>> +	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
>> +	struct device *dev = ec_cdev->parent_dev;
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
>> +			  EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
>> +			  0, 0, state };
>> +	int ret;
>> +
>> +	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
>> +					     sizeof(request), request);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to set fan pwm: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ec_cdev->state = state;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
>> +	.get_max_state = qcom_ec_fan_get_max_state,
>> +	.get_cur_state = qcom_ec_fan_get_cur_state,
>> +	.set_cur_state = qcom_ec_fan_set_cur_state,
>> +};
>> +
>> +static int qcom_ec_resume(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +
>> +	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
>> +					 EC_MODERN_STANDBY_EXIT);
>> +}
>> +
>> +static int qcom_ec_suspend(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +
>> +	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
>> +					 EC_MODERN_STANDBY_ENTER);
>> +}
>> +
>> +static int qcom_ec_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct qcom_ec *ec;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
>> +	if (!ec)
>> +		return -ENOMEM;
>> +
>> +	ec->client = client;
>> +
>> +	ret = devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
>> +					IRQF_ONESHOT, "qcom_ec", ec);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	i2c_set_clientdata(client, ec);
>> +
>> +	ret = qcom_ec_read_fw_version(dev);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to read EC firmware version\n");
>> +
>> +	ret = qcom_ec_sci_evt_control(dev, true);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
>> +
>> +	ret = qcom_ec_thermal_capabilities(dev);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
>> +
>> +	if (ec->thermal_cap.fan_cnt == 0) {
>> +		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update required\n");
>> +		return 0;
>> +	}
>> +
>> +	ec->ec_cdev = devm_kcalloc(dev, ec->thermal_cap.fan_cnt, sizeof(*ec->ec_cdev), GFP_KERNEL);
>> +	if (!ec->ec_cdev)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
>> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
>> +		char name[EC_FAN_NAME_SIZE];
>> +
>> +		scnprintf(name, sizeof(name), "qcom_ec_fan_%u", i);
>> +		ec_cdev->fan_id = i + 1;
>> +		ec_cdev->parent_dev = dev;
>> +
>> +		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, NULL, name, ec_cdev,
>> +									&qcom_ec_thermal_ops);
>> +		if (IS_ERR(ec_cdev->cdev)) {
>> +			return dev_err_probe(dev, PTR_ERR(ec_cdev->cdev),
>> +					     "Failed to register fan%d cooling device\n", i);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void qcom_ec_remove(struct i2c_client *client)
>> +{
>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>> +	struct device *dev = &client->dev;
>> +	int ret;
>> +
>> +	ret = qcom_ec_sci_evt_control(dev, false);
>> +	if (ret < 0)
>> +		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
>> +
>> +	for (int i = 0; i < ec->thermal_cap.fan_cnt; i++) {
>> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
>> +
>> +		qcom_ec_fan_debug_mode_off(ec_cdev);
>> +	}
>> +}
>> +
>> +static const struct of_device_id qcom_ec_of_match[] = {
>> +	{ .compatible = "qcom,hamoa-crd-ec" },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, qcom_ec_of_match);
>> +
>> +static const struct i2c_device_id qcom_ec_i2c_id_table[] = {
>> +	{ "qcom-hamoa-ec", },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, qcom_ec_i2c_id_table);
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(qcom_ec_pm_ops,
>> +		qcom_ec_suspend,
>> +		qcom_ec_resume);
>> +
>> +static struct i2c_driver qcom_ec_i2c_driver = {
>> +	.driver = {
>> +		.name = "qcom-hamoa-ec",
>> +		.of_match_table = qcom_ec_of_match,
>> +		.pm = &qcom_ec_pm_ops
> 
> Please always add comma to any non-terminating entry.
>

Ack, will add the trailing comma in the next revision.

>> +	},
>> +	.probe = qcom_ec_probe,
>> +	.remove = qcom_ec_remove,
>> +	.id_table = qcom_ec_i2c_id_table,
>> +};
>> +module_i2c_driver(qcom_ec_i2c_driver);
>> +
>> +MODULE_DESCRIPTION("QCOM Hamoa Embedded Controller");
>> +MODULE_LICENSE("GPL");
>>
>>
> 

-- 
Best Regards,
Anvesh


