Return-Path: <linux-arm-msm+bounces-109009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM8OMHPfDmoVCwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:33:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 215505A35E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 535CB328EA71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BF3381B1B;
	Thu, 21 May 2026 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBL2RSuO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrP7haKF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401A23815E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357516; cv=none; b=ON1b1zp0Cs+/5aPX7aWrU0ZKaJv/mSy4Dh64LtCiehEO39D++o2dEwbXhnH0d2YUlU2JAcnHtUW+7aNDobtfStacEDkk0mCTR+3r68TOzht8OLFG2qrgdK9xz1t9hivIgjds/XIWsBAExBEXbUEze9wSIHmT55fCIcTTBWJT8BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357516; c=relaxed/simple;
	bh=iwRni7YET8FxX6xbOUKaSqI6koM88c23NPlbPCikH+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kR2Te4TGCH0YZubWsPYFrA9j1XUTlbUdmWii9yvtRBsSw1XbKP2sCpiS6F3H4T/2Iuwjmd4AYFuWd491+9n8PADDHQa2YI2fZzAlBsWSLIDb5njOUiWgxVIh4K89NZoUlJ6+bUDrvtE0sfokzC9pAhpvF19sBPgA19ouXXr+RDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZBL2RSuO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrP7haKF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99urV2491817
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=; b=ZBL2RSuOvK+d+ZMg
	i5d7/73CgeGqBo5uln9Q3Q27C4d8fS1kuLp3OAK8Qg/hsrug/LGRRaCsw4l/fJ/7
	Jbiq+ZJent8RKlFB+ygNkl5PxjiJkA9wXWq3tPa9G9Rvtrs+Cnk0tIZru611j7eW
	9UBU6HlgBxFUxpY7XnTTWLUQb5LE0VNYN1WzLHtEAZdX+eCrrt732RaTiximS3lR
	Ph+6FqVLG/NufVLk63i3a8KDnR04MZtDnqmM4V7rbQyukfOafoRgjrGfY6V7G1I5
	QeaZW++k47wkay4sYlgWxQ2Yh5qMbXUHo5gG02n5ECW2BPyCfLdRBhgCU8LY8odt
	JPtMBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j4cja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:58:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9f1bccd7so15317931cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779357513; x=1779962313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=VrP7haKF5Zzfucs+tYdwQh95KMhcliPdsbupi09QnL3pGEO2Z7gIspv/9/fLa9MrHD
         jmFXRRgMIN5u9l0MYvnlKqjw+DDvGHprHEfWl8ipoHkISUJmAbuDIfKKu28altSc34vO
         kZBgJQGZK/79Z8g1AaFdfZ52fwrItholtArL9kIptrNGoIgOK7K0B7Gtw4FERAFuvWQL
         AVZFe3ckzm+kYPCXgGfn+lr8NtY2tNY3rvTT56mr1zhzU4u8gU6KBteEp77EC0koRs4K
         K+8R9TzicUGjyJRMSZrxiRFwXMcw4+S2i9jmoZPpLF9A3+13RS5U+4azrEHiRuk0oRIK
         l3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357513; x=1779962313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=ssQclBIUsdriroU+lbvwje8aD7EqvdvpUZ9nxQYPlYccX91qP/60Q5SMi7oGV8Ec2Z
         bz7O+xk+HjYrbVc3tuQlF3jbgueMY/zYUXt0PySgvAAkFCs/DLnkayta5ezbcdYsocen
         syTHIZjDodRSvaSSCJ0ysfSqKn49wHUSo8lakDozFRRLYIipQMmBh8uJQCUvZR0NdNOg
         wbDD6Vyu8szx1ejxJTPU2BplI/A3uTTeHeA8wraH0sb3Tjm9kVFZyl8dFbYpeG/eNjL3
         nM0LLu+hhv83k9VT1sB91E898omSWZJIFy9Xo9DPcFBvKqVXUAq4kEVvVxYMc4H1b4Oq
         UZcQ==
X-Gm-Message-State: AOJu0Yxe9958Htn91dO9bogsl2ftRmcXNuRwbFdUocxHvw1fQf7tZR3D
	+0uX2bcb+Ma7H7jMgSKejXC5yIo8PHANEIIlRRrY4seG9K931Bszegn76y1A8Jk2Hh8haZBZSxV
	j82hhRvFGC/Xh7B7GKNtc/c02QevrYg/tWp9JaCBKesgwW5kfsROyIZ9YD0NMJWGS3zeB
X-Gm-Gg: Acq92OHYtp5rlnE6NS2pOfMJv9CsYikHUCZcCy/5i56fuWpkOQTcxHuIH+GGL22b0tD
	jeFxOhSyPw9AL97JHYusJI97IuKwCPwsGaz1kBGcdPaM/SE8/7p35TR1ybpKQ1ZkIx1tGFlmwFP
	CrtEz8wUjzoufjTJcA002m+LHqTGmPKSALsMx3g1Y/zuQMVv0FQAjuqOXrIBLeFzP5trmB4jXWj
	NW+mXh4OkAXzwiJaMaGTDTU9vb+x9f1FPS8VYrTlls90Z1Ds25SnV9zyuSx8gYxGfrHTtHhMtXV
	q60gWor2lmOFUYERyZejk6krUOAJsDsfGavdWoiEsPIHsjj2B62dktGqwBn9FbmHNRL7R1lcNw0
	rIIJsC5dHtJd7zah0DBOoMuwsVjkPysOhUqYmscQb2Ju72DvkYh/6YmlOEp8lVfeglsuMctWGdb
	hKpPI=
X-Received: by 2002:a05:622a:608c:b0:509:d76:fe73 with SMTP id d75a77b69052e-516c55ffc3cmr18399061cf.3.1779357513469;
        Thu, 21 May 2026 02:58:33 -0700 (PDT)
X-Received: by 2002:a05:622a:608c:b0:509:d76:fe73 with SMTP id d75a77b69052e-516c55ffc3cmr18398961cf.3.1779357513106;
        Thu, 21 May 2026 02:58:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc878912f4sm25602766b.5.2026.05.21.02.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:58:31 -0700 (PDT)
Message-ID: <d81e7cee-eb26-41e7-a1bd-09bb2691b1d6@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:58:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sm8350: consolidate IPA properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
 <20260517-ipa-loader-v1-3-3c3764c1b4a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-3-3c3764c1b4a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0ed74a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2tTTa69PSMra328FOmkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 2nBEk8KX88M3UGsREQS2OddJU_4LZZFH
X-Proofpoint-ORIG-GUID: 2nBEk8KX88M3UGsREQS2OddJU_4LZZFH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5OCBTYWx0ZWRfX1RT8KiNpOpi2
 B9mBqA2o1fiEYN+n2BjXFHDVNvpg8fMUS4NPBrICWur7Au/zgWr8yASMLeR9r+OOq75dMzVJnw7
 S0tuTGcGPI56xLY/wWD+C77o94QLmD2si6q0ixK2SLv7d993NRT1x8t+fm60bUGW+0p3VszaPYY
 DgQF69XMBM5RZQRDRPSsrsbpUJ109HeExN0F/r9Ze2KxuAAZRfbimaBGGDLwsWuOfoFbd9pA2/Z
 Op711sYo9IEypgdYY6sD4n9vsMBHL4ZaBup9B5eM/5j4SsKzUfXGMCjynbxtTgtZRMKQIqSTzff
 HCbL9THDQJ7BH8uWh2ybPBcobf+jUR0UCQ1RZNEwzPxknEXt4CKb8qgZ6LjOVAxrg+x9vPP4+eU
 KVENoO+9n341L7L4altVtIym44t/T48WPt+TsbaBEzl7OG+FxDOLX3ct1ZEMQG1AFyCs0mr1PYS
 TKA5k9RxTLRyoYy711w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210098
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109009-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 215505A35E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/17/26 4:56 PM, Dmitry Baryshkov wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

