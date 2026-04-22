Return-Path: <linux-arm-msm+bounces-104103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2P4zJ/6y6GmIOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:37:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5F74457D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86B983047078
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3F43D16F2;
	Wed, 22 Apr 2026 11:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rc+hQT8h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3rGu4/r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D83D091F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857696; cv=none; b=I6DPMOP0+1n2qEfKOo8KrU6csgpsx8JHZmkfIQhkXbn2Pd7eK5qPGBJkMNuBW6j6O1FwQI7MLkbx1GsOeEuIMIFJoX6KcmiIQ3L8KCkau1530B3Pag8NuXJoKPTrNaY9LCEkvR8Xk0Q5o3b0j5EU71HHk3eMj1HgJ9kHkfJqSNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857696; c=relaxed/simple;
	bh=oQYA1C2/yJyBSHaQ7CVd3HS1eb2vRrc2iFVxGKUvoy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dwpefy2xH6nCTQVMF9inpZ88Ud9Opsbru6AYBuPqx+994a96+fYjpM8pWua18yVADk8/ukljIJtVdcuLM+wOk/p635idaJvZLg1nxYqKTcFsfkqS+8AnHD1hcLM9bqc0ARVOD8I0aQZMQ9S5OUVug9t8UbYRMO/kkE9kahR6mCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rc+hQT8h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3rGu4/r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M96FsL664172
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VhO0gxSkAXa9LgLOly/QryTc
	7t2IcIRH7zgG51UsBJ8=; b=Rc+hQT8hm+RCIrJkigO0+vZkRLzezCnvKoOYjE7A
	vdA7xdFGq1aZrsdp4o+cZz0HFBZBcPkU/GK8ydRrNVdKLaKyaTuJ87tcdzyzmMj4
	zmi9WoYQ0glEOxetGncThQsWZc2vBSisfREnXR8tMS0PFX9QdUJP46kLcjjgzgIp
	yJZe4sccvRsHClemJ8Bkta2BJMmsYCpCv6cDqPtZFsiVn4wlnJKoGlrtUxp11RRq
	q+KEdXsbHMc1ViaP0ckoTnj+klZjbSovZRERM1vRdqvOlMp7Iz44Q6dsWpwemdUb
	A8lt/H8qqSp1TjaRcSlofCltQ1hUxhHQ5Sf6q1ij5SkY9w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgrhg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:34:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ddd8ef5343so4969062eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 04:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776857694; x=1777462494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VhO0gxSkAXa9LgLOly/QryTc7t2IcIRH7zgG51UsBJ8=;
        b=B3rGu4/rSVAqspWR1b0DQcVDslltnL9OXkjqom0oigWYW44D6L4F26tPU7RGxlQb50
         fH1+4B55mOKzkgjCtsgsIeFWhq5HFbYuRWHsXGgkrP8AwKFSU9zvIYOeA83qjk2qhOD3
         n5FWfdo9p2+Nui6WjZWjfmf3ukqiwqiWOEAKm/Xo+7k5TmJ1iVh0xrAXBHcHNYu11tSE
         0Op51J0mrIYa8u5pwtoItcDJWBBkg2OpNmOVqtS3EunVVaB5gelShe+0bgaQI8u31ioL
         Yzo0hEgmoiSTOtxCtnO1U7Aqqzs94amynrYBX7dhrSh5vPcVngpkFMCwwxn5DZgv0Jhw
         t6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776857694; x=1777462494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VhO0gxSkAXa9LgLOly/QryTc7t2IcIRH7zgG51UsBJ8=;
        b=n67S5qgTO6W73rFhYrs361DjoZ86S/i+IjCp8+3jDTMMxGJityWpoOesjnX/FfTsX4
         /63tt2tkaG+gSitTH6ZPvxn/JP4XVqP0GhkttDWiGdfD2zdpUVDAH4paxyj1Rj9AlSv+
         uI0JCOE7AyTMOlj195Zm/o2uDP9ASQ6WL9vplWhYo7Jz8gjnHxNIU0Woi/GqQepNE1zs
         9jLhypGbXzFMceAR6gAwDHjymQS83xVaa67P88gXNtwQaoAHqrvIA9hwNgyvt4UQkLhJ
         QKpT4z9lSKBEiVDK0AAohxg6ZefGTNhsIB4/2fOW8Vi1GR72p8o0TDsOP4RXJe3okBdP
         AfCg==
X-Forwarded-Encrypted: i=1; AFNElJ+bNzadF3DktL3+lpXICqjk/rB3MshOXcTwlLmineA7hb1gGV1FrRVXutPmxkZ1cjQE3Eeznhe7bipxZXyl@vger.kernel.org
X-Gm-Message-State: AOJu0YzmXRbPvbRzr02O8OZImiVOyg1a5Y3YfbtMgl2cdzZspQWejDwY
	NswX3YwdivRqzW8G/VQZoN9+tOvPXoDpSkG9wF+JtTeNnSg17VAsswr25Vm871DnFz1C2b4n3a/
	j0yKR0Bckqc8THzWWETaA/zxVN8FdT+5aDEZMDTSJhot0yDIyyr1dJLAG4uYpQ/U/DA/n
X-Gm-Gg: AeBDiesj9J6OwAQFKhWeLaIYfy3L1h2KQFe32/jXqmXpazZ3Y30Wh+ZNlI2gFTRc5aD
	zWVXjrlgf675II+OOfvnWXOILwJvK5yvWtZP1TfnCB0c4AUe7n53HyUVyBtmC/9q+pwe4/7CSs9
	3cb2qOh/nS2ztjktVXLpOYdTA2YDa2G1gRe82gFqC4PNqgd0rEXAjGML7TLMkffQS2bqWTO0ZOm
	YlwKlBzjSnbLTcgHu2Nd/ZxcIi8twrd3duAYM62AcmVoM0EfSfh94Tj402bt1LkDutAUDx7EKNz
	QR7VMOyympt1UN4Pb8u2qmZcC3bMlESr8ZNwgD3hLEpBRLWMX47TXBxiQqLYpUzR6Klso3+dwqE
	VLyNesaNr2DqSe3rhKaR3WxskIllkz8ffFSJUPVPMsFj0L102eI3UZEAmMICXqaykvbEzzOaI4l
	Q=
X-Received: by 2002:a05:7300:748f:b0:2c0:d46d:cfc2 with SMTP id 5a478bee46e88-2e478a2f02bmr11207698eec.23.1776857694410;
        Wed, 22 Apr 2026 04:34:54 -0700 (PDT)
X-Received: by 2002:a05:7300:748f:b0:2c0:d46d:cfc2 with SMTP id 5a478bee46e88-2e478a2f02bmr11207677eec.23.1776857693771;
        Wed, 22 Apr 2026 04:34:53 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce426sm23243943eec.16.2026.04.22.04.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:34:53 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:34:47 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: crypto: qcom,inline-crypto-engine: Document
 Nord ICE
Message-ID: <aeiyV37HvuCyS4BY@QCOM-aGQu4IUr3Y>
References: <20260420073301.1250197-1-shengchao.guo@oss.qualcomm.com>
 <dd5ee12e-1aac-494f-a8f8-74e236ecb47c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd5ee12e-1aac-494f-a8f8-74e236ecb47c@kernel.org>
X-Proofpoint-ORIG-GUID: FuPA3JIkuiPp3Om0Ogx9CBVqDcT_vqc-
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e8b25f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=lhIjiZdZG9_ld_Bbx38A:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: FuPA3JIkuiPp3Om0Ogx9CBVqDcT_vqc-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDExMCBTYWx0ZWRfX3ydikkGbkstE
 Kl5Ek1b57aiBxQqfqGzUmOEKGmfBdKJ9I6V3KVikLkqMctofVYCmuoMnYPdycA0ARbIhCDDN3cM
 WzXDhj4LhGwKoRd75HHE9fQ5A8MbUTqiRAhigQY9qQXdSlf2FRXBK/SjRQY2tWWyR6cPavuCLY2
 SN7JRM8/7dXTfDRfxJxZJNbtvkKp5iIvuKjwu4J6bGuDGHywyVbDB0wdvI1tJjgzEJDvTzoAoyi
 ABwoP0h013HaBwJNEgm+j63z/79CkSnZS/sqi1qPB7/9GMtbZbp/gU6jVDYCQcVPUKt/QlleFLr
 jEuiMh3YudQJAn5trGmxeeuw57wXm1UgpYXtrPql9IM9gevANbgIGGyY59pgsb7vh0t1HK04ris
 CPA7geA5lbTHBN0RTJ1qB5wNrWrlF8LrLlvZTlqiw/EYTCW5jXrVUN8q7RIYGrWeIH1rDYmEqso
 ZQ77uglCqCaig415bCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220110
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104103-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E5F74457D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 10:27:56AM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2026 09:33, Shawn Guo wrote:
> > Add compatible for Inline Crypto Engine (ICE) on Qualcomm Nord SoC
> > witha fallback on qcom,inline-crypto-engine.
> 
> Don't explain what the diff is doing. Explain why. Why do you use fallback?

I will reword it as:

Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC which is
compatible with 'qcom,inline-crypto-engine'.

Let me know if you expect more than that.

Shawn

