Return-Path: <linux-arm-msm+bounces-112825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ccNOC6xAK2qy5AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 01:11:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5228675C6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 01:11:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WpCpPe6x;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ieu+8VxN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112825-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112825-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDEB2320F46D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 23:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA9632E12E;
	Thu, 11 Jun 2026 23:11:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C133803EF
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:11:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781219473; cv=none; b=WUYIi1qcelF1QhLxEsxle0IPVLiQqP2DOjPUWlSVN5IZEMfxV7w7H8Om5llBlr7Eje/lmDv9BGFWrPSj9+CfAn9ttgaLfvmlPjG2zGSmYQQGnRvjh7SNXO3bk5B9QUAb7+oKMHUzvDvfnt47MKo61RbIgFQKGV/BNLfEYO/Wo3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781219473; c=relaxed/simple;
	bh=7llc2zU704CZuS6wcMO/gSnF4DuWhD/d1CvuLJDTGr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gz3w8lNApyCj++QBLSMkzaU/I9pMYOJtJjUPahHa99UL8WpsnJRpUnpZYcRZN8ckrY4qGrM5GnJjahM2t3nrVP6pdL+36WuOxR7BwGBa1prZWuYm8TfUWuvcn9zh5512W7QY+dMIdip5Oar+nDGFai9gRXLZL+OWVZ0JPPO0/0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WpCpPe6x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ieu+8VxN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMSeq41912191
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ra7DsXwOaiwrHQtA1SnHHFQrkE42atPpkf17mbDUMI=; b=WpCpPe6xOrIw3GJw
	OB2xOx5k56CxaWchG8ZoWn8Tp92pVo73Tlz5PBuM6DNP3QWC5YObQT2m78CfBNW3
	uqAdeWVv8eCTzXjLNUrtH8HlEtmyT1E5TepGS3twnH33iRZCjB1Wn8mKh659Ii6/
	VdCctGfdTa36CJivRtBjUvApbvG//xJj5PSbGgy3g67umUwKPlZMdo2bDimh2Ums
	lokv133+AAFudw+8dQlvmlYvBA/Y8kaIm9rNV1zDVqrAXLwkwOR52cQ9StYG6Jj0
	nAh3D/aSgA4JgAjHsR1xGYzMYnl7mTVO+YnN1+yzVVuyJqeOfVazcFS+4UO3AI+d
	RHntVQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0x7hepw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:11:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8428419982eso345165b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 16:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781219470; x=1781824270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ra7DsXwOaiwrHQtA1SnHHFQrkE42atPpkf17mbDUMI=;
        b=Ieu+8VxNigLKj2pQutpJHiUwFxktPLUaZUNXNkq9f57k5FCF6ZhvZ1rXqLa1Fya5Pm
         Iv7mT/HMUJ8ZlAFxfLCuF1aA3zK0I9ve2Eab2P3N41ClACslJ6lm/vRR6iqw3cbuGTZf
         rYHkP1x4/GLgcyfHy6wEyk6ABHI+DwtOrbz6gJHDlx/vcmngDJUjTAKwktcvRaMpsq0C
         MkswauyDN8oDfalH76JweNGKKq+3k3X1TSqNf+D3OGKU3Jr+a6H+CWQeDsknKIHDwhek
         NhvOpY4zg1xe8DdVZa6SKrkENDpdQAqJDToTlh9VPBu1eW8/h+unbh9gXb/un3b/tCBz
         +mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781219470; x=1781824270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ra7DsXwOaiwrHQtA1SnHHFQrkE42atPpkf17mbDUMI=;
        b=VuzGV/W3VdTf0G9VNq/F2+CwxyViDjwFZFp4nlI5S/oSPg9SIFv8zdLB/G24OT8wRS
         6cYZnZBSPQTSOzEm/e05s7U1m1eq4F3KIyxA015Bhwi3zmz4khj2+oxbGLuyjom04Jgk
         0VuQB6nqDGjf4vPGJ6BNhDWNFjphbQLg3E+KX/q3xVWv/Uc/r7Rr3mhzfRhy/bzd8Z+5
         F0J4xuY08kTsdhY8wjmHRDLU+70nz4NobifmnUeJQoYmCI8J4cnJ7A1wpPrkn52LYMCv
         E0JBYCk0k3pXOmfK7trktV8L8AWZfZeOLiozUbv5HC+NKh+D0iumu0QLMwfEF/pPGCFt
         e/Ow==
X-Gm-Message-State: AOJu0Yxn8HggKQ4l++ESSu4YejtUTT/952szfRTF8t8fCg13SlzpkGzd
	17DyppiHq5qrdJOkEHJ0R4ZaBGy+dGaPRR5RxeIShnVzdFphJIqkgpAhzfCi6gR15JxbHLk/gX8
	uaXCFNPZ+pHGRY/vqypYf9Gz909/mar4n7QFFGEhmxHJYeMYtem+y35EPn2p6h3TenD6v
X-Gm-Gg: Acq92OEQHwVef26UZ8UnDIrlvmoma3/K+CcrBa9CxjlHL+I/zmuFCvUPeO/5goSnHf0
	E8ZAZe9Hs2VQ8xSnAvtnhX9y8eFZYMU8q4wrrLPqFBGXmFR3QX1tnKO7u9/LLQCQX2WPhRlVka0
	RvO6Nrb9bF40Hi8jII088EYoCOzkUCklQkLznFd9ycqFpgSV1Bk4dNeByFVGfmM7SHwrmeYFrpl
	DIPOUI9TJmAoH+KUE89XzFDhV19Xac21fZKAjdfRJmawo5ypTbdGIMQOEWyB5Q5MvhMZU6B8B/p
	bk1RGG05PzUqvWkhVMa8Zi8v07wUOKYBm4XFYyuJrFx5nls4uNHR6jia4fjsDxFjG87mf0IGFTh
	xc9LVh7cQDuzV6BByDjRoOG5mYn0Oo7wI1lH20cvERlT+J4yQILLXH8Dp5CF34J+aKzfnmKLd0+
	bDbFRL/UvkPG4=
X-Received: by 2002:a05:6a00:1c97:b0:82f:48e:241c with SMTP id d2e1a72fcca58-8434ce95df6mr100388b3a.23.1781219470112;
        Thu, 11 Jun 2026 16:11:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c97:b0:82f:48e:241c with SMTP id d2e1a72fcca58-8434ce95df6mr100361b3a.23.1781219469634;
        Thu, 11 Jun 2026 16:11:09 -0700 (PDT)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm177647b3a.45.2026.06.11.16.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 16:11:09 -0700 (PDT)
Message-ID: <a8bb974f-4886-4adb-baf1-9e6c352bc6cc@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 07:11:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: glymur: add coresight nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519-add-coresight-nodes-for-glymur-v5-1-3dad99fe31e0@oss.qualcomm.com>
 <3c2fdcf8-957b-4b28-85b7-3a50ab8ee485@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <3c2fdcf8-957b-4b28-85b7-3a50ab8ee485@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2arBGYQ5490_BlWSrkD4V_YGcYfByVQB
X-Authority-Analysis: v=2.4 cv=c4abhx9l c=1 sm=1 tr=0 ts=6a2b408e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pvX1nSozBNrohX3L37MA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIzMiBTYWx0ZWRfXyX3ctJ6SoOJL
 Kjdegq14frCv+OdoQoyXgSwJhrZ7vmSaKtPcQVMeHm0YlsN/BZb+F06zK4enhxY/8nCn9m+smub
 A0s/23guvTSmwQ5qEBhOeuoKLArQL8bFYPdHOHqiPG6KOq/ORvP7DEGfORIUblfzVGC1dzUxrJ7
 XOdhAB3+3MKZaq6K0FqorNBCRhbRSZ2M7hdMeDtyZvCoyW1KSvpLT+IU64vT7Lia4HNiaDhMGA6
 d3f8AbhihnC92518emrwo3wwsVdAi+tkKayETiBroWHp8bgQ1lvwUIheIsqCXYPE4zQlLORwZrZ
 q6kHhveL+b79A/8rB9/MFgj3KungkRjIfo1MmlQyFRI0DDXjjx7qv8+KwmjBC99vy7a/qiXlbel
 WgDTHxJRJBrOh4icWsnF1DKuJaLlZS+AIbYK3yrxllSZ0X+odn0slV91oDIt65EGsVPO83EV6XI
 e7AOexyjmy8RoHwldXw==
X-Proofpoint-ORIG-GUID: 2arBGYQ5490_BlWSrkD4V_YGcYfByVQB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIzMiBTYWx0ZWRfX5UdgSOlWmZIe
 NAZr9BUKPKwz7tUaJvBQIP0Xs/fo8vSwft4Mszl6pZ/uHPNCw/eHbImylz+vPWrROOidKZILQrQ
 55N8Lp7MKY+6thjORK3Bh5iWbqcsd68=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110232
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112825-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5228675C6F



On 6/11/2026 5:28 PM, Konrad Dybcio wrote:
> On 5/19/26 3:14 PM, Jie Gan wrote:
>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>
>> Delete cti_wpss DT node on Mahua since this device will cause NoC issue
>> on Mahua device.
> 
> Another good explanation is that it simply doesn't exist there!
> 
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> [...]
> 
> 
>> +	tpdm-cdsp-llm {
> 
> Nodes without a unit address should be sorted alphabetically
> 
>> +		compatible = "qcom,coresight-static-tpdm";
>> +		qcom,cmb-element-bits = <32>;
> 
> Do these other TPDMs not have the "DSB element" as the driver
> calls it?

Depends on the design of the TPDM.

tpdm-cdsp-llm here only supports CMB mode.

There are three types of TPDM:
CMB only
DSB only
support both

> 
>> +
>> +		out-ports {
>> +			port {
>> +				cdsp_llm_tpdm_out: endpoint {
>> +					remote-endpoint = <&cdsp_tpda_in1>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-cdsp-llm2 {
>> +		compatible = "qcom,coresight-static-tpdm";
>> +		qcom,cmb-element-bits = <32>;
>> +
>> +		out-ports {
>> +			port {
>> +				cdsp_llm2_tpdm_out: endpoint {
>> +					remote-endpoint = <&cdsp_tpda_in2>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-cdsp-cmsr {
>> +		compatible = "qcom,coresight-static-tpdm";
>> +
>> +		qcom,cmb-element-bits = <32>;
>> +		qcom,dsb-element-bits = <32>;
> 
> Some nodes have a \n between compatible and other properties, some don't
> Please unify the style (fwiw I prefer the one with a \n)

I will take care of it in the future.

Thanks,
Jie


> 
>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> 
> Please rebase, doesn't apply on next-20260610
> 
> Konrad


