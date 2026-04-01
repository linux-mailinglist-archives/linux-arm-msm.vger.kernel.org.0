Return-Path: <linux-arm-msm+bounces-101282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOZPFo7nzGk/XwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:38:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0FD377C98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E91B304638A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC61E3803F9;
	Wed,  1 Apr 2026 09:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A303t2Yn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJhBVn+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CA038AC68
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035699; cv=none; b=WlfLx9BmXW46xETLyGeCPhOKeArd+ILqDqA0YmjhMd4H9FTf+vJLKCveeAt8BouJBLQhI+FSpAKDpbfsxAA/qBGb1Orm9QrMa/6KDgJwbwafxJE+JtFMDFtc5IglTM2ywO32hPcjWpGoWBkgYi+uZOnyCR89H5YR2BiANzrDN+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035699; c=relaxed/simple;
	bh=tlGyvOsQ9Q6fmk2zG00jdlVEr+FBACdo3u1quHCsNRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6oQUFcfCNRsgS0HeY/M+gbd7lVlhn+P7FVWB2AltOFGXv+z1j3ilvHwnAuzqC6aObZqRIDUTe0lSh2BKuwMZH4Pu1rxBk3g4/sVQ+jnPrHxhhBfIFSCFkmGoiyLRB1ASMLav0thjduVi3gAXq0YK6y0OX060k7nU/Rx3TwLXaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A303t2Yn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJhBVn+x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6319ADUE3174292
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 09:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hz7N9PkiX8JrIbiQeN8cLDfCplbzTBEEohid3YxCQIg=; b=A303t2YnmnedJUN3
	8kxrcrVp5vKYWMkkolXJvxayCp+4xuYLZ88XcsrViQW5MV+ROQE8hEmm4F/PyQOc
	xIMxQ1HIPqsmMGbVI6k3tH0BEjeLvS64LKFUQ3666EE0VMOm2MnkGx6/sswIEt+d
	a4MDzxou9KIPMKO9SD7zT07Y2Y2igoO5Cl3kxhup4SZS/2DC/AkrZkF+JkpldKxw
	5vFG83SkrHuU0be+4W8c4RS0A7dJXQd9uPpwd3+A4raYUAI1R3+Pnemw4IiZpWjU
	g7UeUouilno6+g4poLWjo+SRSQbra/IiyCio56wenH78uFAnFdGgqAzyKY1DsH7y
	iVylHQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d90gbg3t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:28:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954b9b5da7so20783896d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035696; x=1775640496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hz7N9PkiX8JrIbiQeN8cLDfCplbzTBEEohid3YxCQIg=;
        b=IJhBVn+xcyhhz5oOrYW48KLle1hLzRUl5pO+f8LdivVAUZha+OxH8sG4H1IGOpYnyU
         FWJ4t5suX9FjY+Kcio0B4ojQQH6LPC6gdJg3EUt3V2o0hbP2JcFy6B187xGH2u8e2kHU
         FUeWK/RCnqfG3v1t4kCLkSBCaZqMR2z86jU3JqktWbmK2jM7h3bBoUx6w2cZWnXTDh2O
         YPFRA72h0D1AZmfrB0hPs1b9EYuN8d+h6SOWpCMiwfESne62NtQkzpVY8/UvY6vvGerc
         HC3idayiVAB9rN0NRXAeMLzHqtRHAd0hgnhJULxrN/cMGa03ZNRJD89J/h2f0pLerHkN
         T8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035696; x=1775640496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hz7N9PkiX8JrIbiQeN8cLDfCplbzTBEEohid3YxCQIg=;
        b=mu24E+HkXeg+RpFjTKRIIUqOh+1W153nDxbbcX6ebpMu+unwZXrQcwpi3/GlVAn0MS
         yNkT5wIeje+sinjVGybxDTH2Nr5zDeLRrs1ENCgREEOeEYCUunchm8xEwdAhvZio2Do7
         AjLi3qL/CiM6loXwIrDey8tHURNRXtYbt2HMLvd9hhoh/DAiRJe8OA+yx/i0qd1A5CMr
         8hpNOZwZ3RG/zyuOS09bRxMVhpLOr9M4cy40ijCMRRTVS9zWRld11BJK7LueSSqSMSD1
         1/deZ/FqpIjsjW2IRu4THQC6c8VtKY54ctOC6xiVBHzCpBcazwiZFufzvvGoPfIhK8HN
         VM7g==
X-Gm-Message-State: AOJu0YyDUbKFhE8L3fy0Dw4QpJ5t+fJ685zcFAXVF2E9ko3WT+od1apI
	U4bzodgainZw6FlqtbIZVjIL45NNibVyO27SOD+BOlK+wiPBv5kDNfQSFszQMzShnZASCQGCM6A
	RXSvvIJKA78xzoE/og4Er9zJ2gHyc3COMPacvUp9B+LB+8zBXFzgsBrPf/g4OV9VZU51D
X-Gm-Gg: ATEYQzyAaxpgjt75LUyz7/zgWlXKo1gTYuVno0arrYl2T9v37B3EzKMUJ3c7GMMC2vT
	0JP9taTBRa3nZkhDPAJKVMr32BwD+ZwpJ6XMQii/AxQ2Fktogj5lbJFWHjvxJdylne2xB/inlAj
	3f3Ia3uvf7fDW5MBhKumQWqOT+aPtpFnR+CH/h019SXdf+MpeB8v5Mg6abB6qrieqtcCVIOJKVq
	6Z89ErCrswcvOgxv6hH9hiar1ktlQcPTQfD+lp5util9eANEk4g2jryz1Chu6jKLdQhdU47s08o
	k1hI7HGhB9ANQGdaVZ86rktzSYzsZFJ4C5lr6mq/c2fTcp2BhczDrfc5jqkdOtWcw+0MSeosWxw
	ZEWcFWbqAUCPf2xapuTkbCO5D4kop1ykT106R+sh0/WzzjrbGfa1kWYA++qB0bL8z//HYtMPBog
	j3t1g=
X-Received: by 2002:a05:6214:5184:b0:89c:5285:200e with SMTP id 6a1803df08f44-8a43a55cfe7mr28850686d6.4.1775035696586;
        Wed, 01 Apr 2026 02:28:16 -0700 (PDT)
X-Received: by 2002:a05:6214:5184:b0:89c:5285:200e with SMTP id 6a1803df08f44-8a43a55cfe7mr28850556d6.4.1775035696097;
        Wed, 01 Apr 2026 02:28:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae23f18sm490825866b.1.2026.04.01.02.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:28:15 -0700 (PDT)
Message-ID: <df008f79-a38f-4cf2-902a-a147b1665668@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:28:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ARM: dts: qcom: msm8960: expressatt: Add MAX17048
 fuel gauge
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260401-expressatt_fuel_guage-v2-0-947922834df1@gmail.com>
 <20260401-expressatt_fuel_guage-v2-3-947922834df1@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-expressatt_fuel_guage-v2-3-947922834df1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MiBTYWx0ZWRfX9Pu/P21GoUxF
 1Id5fkojm8sKxFRvwuJ53zorL1pzmGyUWtrCN3uRvee00iq5jnPyeyVS0odwWXZsQTM+71aclEc
 u8xR8mWc+9loyepQpO/1BkvnPkWbShg6Q4W+s9x3BktKSh4FLTeZ4rUYNWnKc97AARLMgH9mkOa
 myvOU8N3bgvdil2+04ecg//c3g1kNto9bZfSS/7Wkj9ucHwJtDm32AzyonmVn6wSFiFQDnaze64
 t+MisK/F6m07oV3wdZKNTY2G4lNCHEMsTOQ5n99GOnSSLlqjiieqWozxMT5oAIvlEA48JK1YSc/
 XAhZPeKq1xWEea3YUKKTSUJVLUSi6phEmZIv+gyybfhD5/4+NKldieZqXWdkTELqeqTyBktsdDX
 SpfhRZ8cpnKr2b6if7qbTTgRBlg/0gXCt11GpmCeoMdW/TLF7cLJ3akQskMWLWPJcBOOGgQIIeT
 cGyagmdAhgfAeuqLlQQ==
X-Authority-Analysis: v=2.4 cv=QJJlhwLL c=1 sm=1 tr=0 ts=69cce531 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fMfskPNpDUH_GILrBU8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: V20lWpevowtap5aU57hpOVzuvEHmB-Dq
X-Proofpoint-ORIG-GUID: V20lWpevowtap5aU57hpOVzuvEHmB-Dq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101282-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.36:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E0FD377C98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 10:28 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add MAX17048 fuel gauge support.
> 
> Tested by comparing battery capacity readings between upstream (mainline
> max17040 driver) and downstream (Samsung max17048_fuelgauge driver)
> across a full discharge cycle. Upstream reads ~3% lower throughout. Both
> track the discharge curve correctly:
> 
>   Upstream:   95 92 88 87 86 87 83 82 80 68 60 55 50 45 40 35 30 20 16 10 10 5 5 1
>   Downstream: 95 94 92 91 91 89 87 86 84 73 64 59 51 48 43 38 33 23 17 14 12 8 6 3
> 
> Each pair of readings was collected by checking the upstream capacity
> first, then moving the battery to a second expressatt running downstream
> Android to check its capacity. The battery was then moved back to the
> upstream device for the next reading. This swap occasionally caused the
> upstream capacity to read slightly higher than the previous value
> (e.g. 86 -> 87). When this happened, the reading was retaken after the
> value settled.

Ha, nice procedure!

Older phones used to chew through batteries on bootup, so perhaps that
could have had measurable impact as well..

[...]

> +&gsbi5_i2c {
> +	status = "okay";
> +
> +	fuel-gauge@36 {
> +		compatible = "maxim,max17048";
> +		reg = <0x36>;
> +		maxim,double-soc;
> +		maxim,rcomp = /bits/ 8 <0x62>;
> +		maxim,alert-low-soc-level = <2>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <67 IRQ_TYPE_EDGE_FALLING>;

interrupts-extended = <&tlmm 67 IRQ...>

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

