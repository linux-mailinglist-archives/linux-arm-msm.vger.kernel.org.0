Return-Path: <linux-arm-msm+bounces-93870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBU1GAAcnWmPMwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 04:33:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 062DE181663
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 04:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6BB023013967
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 03:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE8D28DB54;
	Tue, 24 Feb 2026 03:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MpsmBFFf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNduJN2p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4E01E47CC
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 03:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771903997; cv=none; b=qX2PpIfj/O4R89uE3GIJc3QSRhuH6AlFcoIOwTUmm+pJPUs5RjPiu4wzOAqdLuZTvSvwKr3QCga/G4NRAX+6dWuRYe/0N+scjbsnLqymN6n6IVfJYZcpjP//c2cwRKr1RBYBh0pumExLn6ZzQNXHaEp+DU76WrINHGaLDSfWs3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771903997; c=relaxed/simple;
	bh=alwlXydTZQTHU+SrbhxPkAVBaJ0ViLt6EMzcXAEspXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMNcVDkJYxMezwccaHDiuHK/qEwZMDD4E/g1qa3iR2dHiIseyLypNYNJ8vkpEg+m7ToA/CK6Aw8TQOkAnKsJIJm2SYBEuJ20qJmwFNBtgkCUl2HbmdQ/ee8guLQWzWvh5f5bHB5Y5xT8C10CP7kEKkc1tL7Y3+v+CmbuSgtM9Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MpsmBFFf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNduJN2p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O3V7Sc1143729
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 03:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cw5oOYysEVaaTcVwIagtgtb1acPAUP70RqJhekAP7Zs=; b=MpsmBFFfOVHfn/pk
	Gg4QcxaaZhK4U4eeUQBi7urMNKOvTDwSza1oS2UzSLIHLFy6kA7W7NleuM4sn6pl
	M4x4z6TjyHPZgg4ou/d8h8DibM3bcqEdiwQu0FeW7LgGxLih+lLSrErJxFh5rbzX
	joWxCc85TVP2OaJiKwZxzYkKcrm6kl8YijJF6ZMr0v7LH8HP2qqM6Z0p5yvz6YbR
	XjQe9GyKv84EeXPKNaDjKC9RSLpcMfINW3laTZ+VfF97K/O+0n8fHtp5xtJi4egN
	BJECOTqR8p85DNs0EfpaZlyZzaGKFuO8gdAkbKig/BVcURryr6jTJC7DzqVx83T0
	W1ob0w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch456805a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 03:33:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso6168313eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771903994; x=1772508794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cw5oOYysEVaaTcVwIagtgtb1acPAUP70RqJhekAP7Zs=;
        b=kNduJN2piySqJTsIrsTMpdTiJaI6B/J7hYurgu9hLrqYQF0OoTJTnsUWe15cFyFWhl
         gFEViEMqiNyJ4LpPTgUavfwUJbBj3HRKEzfxWvw1XNgdUaLw0kKeKf1yMK4AgjMUpsK8
         egIa8T9fWOz6a8Jf3raNro4JLZWeykiCgMUyjFTTNQRmvH2NjrbN2ka6VW2kC/2lqhBb
         Gqe7StgDHok/1VBNns4+GpNi05KyUSj8JBFwciPznYc5guB+ztF4T6n7+VwEHpPsiqRq
         ++VO8rcvQMdLWqwyUKjOkFPUGrmIfK3iQq8OQMeVG7zU0sWzr1zb4gcXRxW4DcKaoPeh
         C89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771903994; x=1772508794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cw5oOYysEVaaTcVwIagtgtb1acPAUP70RqJhekAP7Zs=;
        b=uNQL17kkEyq1gaWFEeFny09E3PBH347e0x/9U6j5WH9pm6ytQw84nj6oOgHvJSinPn
         e0hRJXIBBdV+3tXEq8AoXzMtya6CXsEvw965ceQD4wzRxEKLKZ80EEZhjR+PaIng+omx
         yGtSDCpu7qEx8laBXlNwAYpncBEU0C1fxN5M4pfENjBguV64eV4P2jYClzZORBrwvEc0
         FnLlXDKXJ5UmuC/wvCtRPDWcqcPlBZ+pCkeUvGxx9kOFGoUwnnWExaxxkvJVKo+DwZUS
         GVSirQZMn1e1gcjP7ZNOjoaxLKdr3hYBQSkatwCzmDGOOvMSLqfkL6U/1yCeqnvtnRu2
         +JLw==
X-Forwarded-Encrypted: i=1; AJvYcCVqKd+iLFpaKUhOmIPNjcsmB5E6+6afv8vdutHGIatBd09gvI63QaVP/YsFLPnt7sk6tA3f/Jftl3sq580w@vger.kernel.org
X-Gm-Message-State: AOJu0YyvkTozOpo4HTH0oRQuKmTaZPm1yWCMiXf5eDroerTe0PjNXG7S
	NcvYAQib3lLjw3w0e53spY91e03Rq5D3j9V7sJT0xBfRwXoXlGyaiYmtipI4u04PRSJoSYS/9gm
	HGG06UyDzzc6awOtRriMcDERq7iEAm+R7Z3cp6T8mBO200MNVRprXSLRKP/gkF+DZRHfV
X-Gm-Gg: AZuq6aJ7gMAkJJ3Y5jdfdUa7xabC9TQdYGfXqD1yl3Lo8cQVm+bzpGSBeJXsvibZo9j
	NxItI4uoMuuxu6RtPFTSQWGkrr3j14/9iKv8pRwoRhT1IXgbOfC7sgI1eTweuuoOoEgx+KQgryq
	+TlW/jBKdxMm9ShNCSnJ0evPzkW0fxREgz5arHpa7qID/vwYvMS7xc1GqpG1bhUOGGwov01VZdu
	5y0uZbnA9VJbNA3kbZg/mZIQHgm562TnEdtr9UX5U/gxcXM5Rw/DM0MhZ61z9Ho5bJzVXXFMaVT
	CCz4jzPJGow5dVSdmecmYswtOpeEN4LVFTXq680pacqRohc13JvOE2/fCl3oa6tBGVYXKoF7+m6
	uGVsCLRp2WM2lSOk0JmkqrwqhoVKc7tWtw6TlG1MSSp85+U3WCiJGAEM=
X-Received: by 2002:a05:7022:4387:b0:121:9f05:c4c2 with SMTP id a92af1059eb24-1276ad18ec5mr3365891c88.23.1771903994053;
        Mon, 23 Feb 2026 19:33:14 -0800 (PST)
X-Received: by 2002:a05:7022:4387:b0:121:9f05:c4c2 with SMTP id a92af1059eb24-1276ad18ec5mr3365882c88.23.1771903993530;
        Mon, 23 Feb 2026 19:33:13 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af20fc8sm10325680c88.6.2026.02.23.19.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 19:33:12 -0800 (PST)
Message-ID: <e94ce683-d47c-4c8e-8b26-cd327c891cc8@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 19:33:10 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kavgZmmrk0IQwEPUK4urFC65fLhOZReL
X-Proofpoint-ORIG-GUID: kavgZmmrk0IQwEPUK4urFC65fLhOZReL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyOCBTYWx0ZWRfXzrRT2/xFRl3M
 UVzUjNZMLI4iRR5ZVbca/uwgsVpqPKSAamBc1kjpTk/n3MxytlNQ1LyBrFB+UOshQY7uuNfs8n3
 tcpgwou++EmLeVGNO28iiVRxzcsMi6lu2JzYivbiBW8wmyp31HqyTivhPR48TVpP5VUotI/J9yU
 hvYwnz1eWqBQItA0r8sgi5mY/4XHz59gh5m4yaQNh2gDx8KK/V0Jor9N/L+0NL14OAdV8zhDHdc
 Le1vHyfiXcuV2Y93DAJ2q9Okarxj+FknqPQd1yU13kc1CjPykWhbJmov7oycPr4XYQsIc74p/W9
 8YAZBdocQevbSZBe1yaNhRAl6dOCmJAaWZOaQlHeyCbYUITTg7KnmIMP6e6xMXl8KrwsdthfTGj
 q8v7lYGPBq3hOtVMZruffvoBZW/uT+Di1yRhR21fEBChnxVZi7uyq+H9ER7TNnbu816Wz68+Ugo
 C23XRIzpafFEUFbeaVA==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699d1bfb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=88Pab4rnIKjo3RbOS5oA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240028
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93870-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trilokkumar.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 062DE181663
X-Rspamd-Action: no action

On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
> integrated in the DRM accel subsystem.
> 
> The new docs introduce QDA as a DRM/accel-based implementation of
> Hexagon DSP offload that is intended as a modern alternative to the
> legacy FastRPC driver in drivers/misc. The text describes the driver
> motivation, high-level architecture and interaction with IOMMU context
> banks, GEM-based buffer management and the RPMsg transport.
> 
> The user-space facing section documents the main QDA IOCTLs used to
> establish DSP sessions, manage GEM buffer objects and invoke remote
> procedures using the FastRPC protocol, along with a typical lifecycle
> example for applications.
> 
> Finally, the driver is wired into the Compute Accelerators
> documentation index under Documentation/accel, and a brief debugging
> section shows how to enable dynamic debug for the QDA implementation.

So existing applications written over character device UAPI needs to be
rewritten over new UAPI and it will be broken once this driver gets
merged? Are we going to keep both the drivers in the Linux kernel
and not deprecate the /char device one? 

Is Qualcomm going to provide the wrapper library in the userspace
so that existing applications by our customers and developers
keep working w/ the newer kernel if the char interface based
driver gets deprecated? It is not clear from your text above. 

---Trilok Soni

