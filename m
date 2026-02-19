Return-Path: <linux-arm-msm+bounces-93406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPsTC2Mbl2ktuwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:17:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDA015F613
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 965E63003EE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC3E325705;
	Thu, 19 Feb 2026 14:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MStE8fBt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OXH0nrA2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3E72877DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771510600; cv=none; b=P9RhdG1z+V/+Yl0aJODjkbRTA8kYiskw5e48nGBwEYPIMnDB9hGuJ79zPNFLv1f/WKnaV682hwTxfZlVnnczg+vZN9GJxAmChRyQkm79CRrdxPvRV23eCUzMoz7dE9CdrRMFTNdP8lmhrNrkeIwpFUt+g1TwAv6BVFXzqSGGGUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771510600; c=relaxed/simple;
	bh=HETJtyp/JHXsiMCimm8i4MBIY+1eT0ucGCYLZLoJtZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0y32eHZNIGM32Y5dqN19F4m0Bg/XAkGC1jfwOgZT7hC7SAop5OJaceaeCIdfgVLCCF8OOqcHIf7fTRbl+SC8A3MaR5JemyjYc0zSn7gTCf1s4LzqikYdPN2KKcnN/jLkJbU6CjC+WU6HZF+uXKAkRYtpnbma1sqV0sk1WbVTlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MStE8fBt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OXH0nrA2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JDQTbq159734
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eVTlPMAt7Z1bsoOzdrd3oAbIg8fsyWqJ8xySgQqtea4=; b=MStE8fBtZOUKUu9n
	vUMojD1crSoWkyPBexB8gFRzTnVcIxFjVxLFfjijQV7GdM7m+ywo2kZXF7QOgNxI
	NvubO/E4hPofPyPZQUnZUYudJ120aGrighx1bw2QQX5Gi5mdAhf14BMOLAatKpTF
	BF1BTHMV4nFcD/0QCdLACBj5DEWonKzDnRmoJ9cgijs9ezRsBgidRhEeTlxxrjOh
	RQQ4/ietCynJV33JpS+iejysbPud8ZooZzfoenKRbH74TwUk3PadCPuPVFvO0UD7
	MjyW03yGCE9ZINYsaUqWr3Y9PIMAyFBV14wFYSHKl8EIjAnh6xvSOKRwf7UGXWWU
	Ry3Ktg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrpg9qdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:16:38 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5fdf3c935acso173710137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771510598; x=1772115398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eVTlPMAt7Z1bsoOzdrd3oAbIg8fsyWqJ8xySgQqtea4=;
        b=OXH0nrA2+93+e+K98A/G83O0xqSYC/u3kWsCVKVr+7q+ZvLPgFXC0dwYQJYT5hrAtq
         8QqzZoooC7zReOJi14J/Tol9Uldk02Mg27d6L1ZWPbqGTu/bXmGgwDgNbfhmGp6Pi/aY
         pv/W3ZkoIlCG6tfU6JBkVUM1ldCMWJVRxPvP2Z0wEe9o1KR8nieTS2HoZNRXprPWfriZ
         OGCb97ETl6hxg7xk8xov4tjYC1GPZRFfE43fOqNw0w1ngCtyyS5ZCZTM1tZ+KJmD8ImM
         gCUiL4dJNp/uCEYrJ+1opDtxxjYrqKkoHyz28MN7iPh7hpw1RwRme3sii/Cl1+2lQQ2y
         zZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771510598; x=1772115398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVTlPMAt7Z1bsoOzdrd3oAbIg8fsyWqJ8xySgQqtea4=;
        b=MRDn4YZ05HXXl8yuFQO4GhQF7UG0SJlRdFkR2Fmm1pRXJcoajoCeq6QGbNxRwp8oPN
         NDl4dF7Sen50jfvHr6/RAXcEqz6FYGJed1O+HbTKSZcQmM2QQXz1UFdAW0dlPVjvZScG
         /uLGXGnIFKYjvP6Wm21jz5xkRt2av1Z9MCKQDztnCGcMPq5c8NvRMen+YnquVdrKzSxQ
         r878feQiUkI60qLQPCDengLhtKiinqSDHe48rvgXryQwq6E7HSPMhLcC0X7o6RzDE+k6
         B1lonhstyAY5SRhtAMQCu/4JBqTt+uRCgtDU+IXBdreAlxbgZEhZRUgooc57p3o1kckq
         X0mQ==
X-Gm-Message-State: AOJu0YzwnD+iGElMSHPQF9aLx/Y947HAJjtW7GR9RSgtElxZW7x1i+5u
	8VFcH/elHPSfOzwChfHbWal1xJr7Eyez56JQ8sCFhDUMd5B7PmvJDdxJRq0yL18kOY+OF2qWVR+
	wBse1FdMgwaKbGQFG0l3EDhsoZzuQ35FHfsTsixfhQPU/dT/05epKZCfr9AvWw7pJJpwJ
X-Gm-Gg: AZuq6aJGyjyNmwach+6bi9Tw6PlZNF94y51XrgwcsGn67Dj/sfmQ2Mb/PO+tsjcB96H
	8r5HuzYeNE3KXcQN3XDHJUHPEEMOynccDguWxbR2Er202HF9gxXuWxJisTZMhIVuwz4ww6Xgr12
	igH3bko1bEyt8i30lB5Dlt43O/o598okBt4VyG3HDmih7xArtsy+jAnFXZ5AQjzpB5FxNVXIBG1
	ytDEQyfsgrZPO8ACXVz1S5nwFdtbNEXCyyEyaR0Ximt9bvKrirQXeky6LAgrekyaqt+uQ9ubUpd
	h4oecZCAV1a/aDct3kJpl/eM/oiHITdLi9OjqT6k0aIrU3gha4q+FAi7k/l0lknr78BXXae+auU
	5g38/pRFlOGews0i1Cp32hU/0SJN5ohfAgJZh4fsP+rtFeZNE5ZaM3OPXmdHtAN5mU+ucMDtqDM
	n9ukA=
X-Received: by 2002:a05:6102:5087:b0:5f9:3927:4b1e with SMTP id ada2fe7eead31-5fe16f0e687mr4498224137.6.1771510597931;
        Thu, 19 Feb 2026 06:16:37 -0800 (PST)
X-Received: by 2002:a05:6102:5087:b0:5f9:3927:4b1e with SMTP id ada2fe7eead31-5fe16f0e687mr4498180137.6.1771510597414;
        Thu, 19 Feb 2026 06:16:37 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7665563sm573056766b.47.2026.02.19.06.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 06:16:36 -0800 (PST)
Message-ID: <15495f8a-37b0-4768-9ee1-05fd6c70034e@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 15:16:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20260219-enable-ufs-ice-clock-scaling-v6-0-0c5245117d45@oss.qualcomm.com>
 <20260219-enable-ufs-ice-clock-scaling-v6-2-0c5245117d45@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260219-enable-ufs-ice-clock-scaling-v6-2-0c5245117d45@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _hx5C0DXUrgRfYQZtWS1ePhbkJbdj1P4
X-Authority-Analysis: v=2.4 cv=JrL8bc4C c=1 sm=1 tr=0 ts=69971b46 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=jUDvDPFTW8JP9J0CQvoA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEzMCBTYWx0ZWRfX0witVt/P0WNw
 /jz3T8I1mPoUOG2iYWfI3LF7aPPrtkYyv5f/9a3OgsH69a1YeC5QCEgbfps14D51MnOXOI+mQHs
 WOA7hqIb66N2goH4hmiQXDKyBS8zeqTARJ4s8yU0idMd5rgGWveX9whwHa9Bwxs+aC6oVx2uaKK
 dQvtT8nzO3BebwoaH8lqQhDg/JmZnpi9BkiX2KxW4hMvgxxQzwtjs5Pnqu7MvT6MA7ILb1/A5sD
 CCB0XBibln2nRgGUvP03XGrlCsnkfzOG3FtQ5/qTWp8qlCRn/RddKMA1xrIHD0UzbjukUP/grgf
 VmyY+YWx1kwO8vD6wDzDebv5BM+bHuB8KnGZkIPdo9ilVxduTkML1TghZE8Pbyc2W1XWtZrllAK
 At65Rm3a7zV9GkcHOaYwL/tdLNd4P0p1wj+weswyc6Q9R8UfkoKpYEeUeXHC6cJqg5F0oukGtG1
 WjotxDRl6XQb71Y/Yzg==
X-Proofpoint-ORIG-GUID: _hx5C0DXUrgRfYQZtWS1ePhbkJbdj1P4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93406-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6FDA015F613
X-Rspamd-Action: no action

On 2/19/26 10:39 AM, Abhinaba Rakshit wrote:
> Register optional operation-points-v2 table for ICE device
> during device probe.
> 
> Introduce clock scaling API qcom_ice_scale_clk which scale ICE
> core clock based on the target frequency provided and if a valid
> OPP-table is registered. Use flags (if provided) to decide on
> the rounding of the clock freq against OPP-table. Disable clock
> scaling if OPP-table is not registered.
> 
> When an ICE-device specific OPP table is available, use the PM OPP
> framework to manage frequency scaling and maintain proper power-domain
> constraints.
> 
> Also, ensure to drop the votes in suspend to prevent power/thermal
> retention. Subsequently restore the frequency in resume from
> core_clk_freq which stores the last ICE core clock operating frequency.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

[...]

> +int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
> +		       unsigned int flags)

If you're not going to add more flags, 'bool round_ceil' would do just fine,
without introducing new custom defines

[...]

> +	/*
> +	 * Register the OPP table only when ICE is described as a standalone
> +	 * device node. Older platforms place ICE inside the storage controller
> +	 * node, so they don't need an OPP table here, as they are handled in
> +	 * storage controller.
> +	 */
> +	if (!is_legacy_binding) {
> +		/* OPP table is optional */
> +		err = devm_pm_opp_of_add_table(dev);
> +		if (err && err != -ENODEV) {
> +			dev_err(dev, "Invalid OPP table in Device tree\n");
> +			return ERR_PTR(err);
> +		}
> +		engine->has_opp = (err == 0);
> +
> +		if (!engine->has_opp)
> +			dev_info(dev, "ICE OPP table is not registered\n");

dev_warn(dev, "ICE OPP table is not registered, please update your DT")

Konrad

