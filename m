Return-Path: <linux-arm-msm+bounces-109017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA+FLc7iDmrACwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:47:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8085A38E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5B6431B71BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA6E39B976;
	Thu, 21 May 2026 10:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVbyJk9Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCyHGeaS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F301381B14
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358869; cv=none; b=qhuo09uY0B1d+ns5ny1jyWKoYsJD3jTZhxEnE73Y5uGI/gu5OUWz+YD/Eh0F/Whjnj1BFmsauDeh8ixaZVIuwCOip7VkndrMftfcujp69g/qUaYykbo5DkkiTUMlJccbVp3XLfkpbYvVeH6Cdfqfj4ayqcvevuNsAnhf7x7rL7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358869; c=relaxed/simple;
	bh=GlKwVxIKRPrLXP2M5NJL6ousDoY1C7FVqTiZqRGfsfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B+IdNjQNZlEQMIm1N678c22kq4OSezdhWvwuHTswTE0zKzFjj9d4gGmtYemUyf+kjwlkOil9kxlD7hTeuOl77qrm8ynISeoqYtOhbdyPg/knKfo6lkeY8tEgw1mu8JYNj8mT7f8vzHgHTZviHNmGvvOVUUmPUtWARBhnAamdTzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVbyJk9Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCyHGeaS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99nR73118648
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E8AgKI2FPi0wA1YJ7p7PafK1iciweieJGNbDfdWAWDs=; b=gVbyJk9Z9D3fPJva
	DVBd6GaFTX8IPKEAEAXQ2Q3gNWF6QF5AMvP4ZL3G6ovlJBzsTu0TcY1ju+Rqe7X2
	tNoDNHq6G7w6RSbWC7c0LZifV6pMwKmXbBgidAqIrAXChCJCyBHdB3saUSRil3yf
	QyLRsLoXYAX+Z5G3+N2NXhKOE9B+dB9Ccv7mSCJ8OZN7p1dJoahWbs7/U7skzQ3a
	QCTZ7wSGY1UqiMd6q+3YuG8ffA+r2WWCme6yb7iQ4fM432g5tPwZ6Hfwgjk9ukmL
	wmLPdPW1nR3zkPd88jFv3zO9+Zzlc53L4hSpDz5Hlgbv6uSSp+CNPm5efngfzxM1
	JLRqpA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r961xg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:21:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-914ae409b05so861485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 03:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779358866; x=1779963666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E8AgKI2FPi0wA1YJ7p7PafK1iciweieJGNbDfdWAWDs=;
        b=ZCyHGeaSHtN/GPuaIqbdL66UGMbsURjzWKRsKL7Jepm5JB/m3CCpzqONObf2ig6tlz
         q2W6pzCn4CM4oTxIllLuIHb2KrqPQa8+dSozwHda7dE68FdYUG1RpYeCF9WSUElJcTKG
         W3m0BFhkWxXUn4bH9i3vk5H4zLe07KDD4Ok77e8dRrKT76tbTfkoEM0RAsg1SZGOND9s
         +sWtz4qJcWRTGAzqDlywEa5xS9yiBlzCZ7ChRASld+GgbfDFPpqrnwHR/avLUmKFh2Gp
         n5Z9u/QSdo1zwAJPHkQzB+kC/TrzHLFgGvJv5VECkgiFb5YLwSwtx1XgsbVjaGrGtuEy
         3WjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358866; x=1779963666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8AgKI2FPi0wA1YJ7p7PafK1iciweieJGNbDfdWAWDs=;
        b=RXnJgvCdVljVeXQtGr8K+p+nc5wTUQ+5bzUD4v52ITKdVVrUNTHEgsbn05uN0vhWQ9
         /9Y/Ry7J6Ari8M8A1lJzCefnxVhRC4d8zlvZrE7VLgaJ3XYgM9Qj4PZPcjhqmMC6SISt
         TWKShpT1CC9MWg3XmYsj9PD/Ec5G67GnzzJVnJwc63SWnFRX2nvfSQmU4WTtghTISO/+
         JTlgmVwwl5/hheDWzcuND3EOKVrK22ub46EWVCqatqjYv+eAGXbEHuXyiLn+zvyl43s5
         7VDaodCxZecUOhTeTU7qf2+P6Cx7rYUBH7CYfQEYGHRux0mzQfnJWEy24cnMisOuHky4
         +24A==
X-Gm-Message-State: AOJu0YxQxu/3jKh4bVYB7UqiIIYckNtXUndMgaUEjB493ad+RstCZLds
	gRz7bPMn4hWhknLQSCk2w7VyBZQQkUPmfOjx/TBy1KRtKlWY7GC9uOjY9mXHMe7f59BwcCjLljb
	tDFHF5jEDxSFIor+OIDQoe/k/CiLGQCUX98OBpJbmBp65uyzEj+z+3BXXGa/eAfC26Pza
X-Gm-Gg: Acq92OFQhMEfguGwEQ4n6uTIJKQAzZ5N+BFASOkPIXnc5D5NYu59NpT99/65B65b0WN
	16GYWz4eVxtxjN0c5nBAuw+pMF291wQ0OJww39PiAu7AqbaRPh7N7gcodYRqwym5vMRA9D621Sk
	atc0fr/jjZU5VX2+8+H+fxqxYvvxWhI7p0Rc/n20+Z2LDyFxSl331sonyKWGQ9wU1FVfKDzxM2z
	/Mvww4FEG9Nj/s7OnpTdJSMm1lHJYdsEqCv7VjSydKohDCexbIW691VfAUWwdHGlT/YFLz16RBu
	WXeiNBUGwVdKp0kOZj5Jmw/xstk+MZ0WygALxgHwmNleqQbBfY8pCxNSRPC34rN3BcPquoOLCrS
	WYtON9M3e+qOnbAMX60cRmkLJrPO1n3iNcZbse7ONUVnhId8BpXPrULk7DJoC0o+4KOiTm4QBzO
	orcms=
X-Received: by 2002:a05:620a:44c1:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-914a2d26193mr164014285a.6.1779358866576;
        Thu, 21 May 2026 03:21:06 -0700 (PDT)
X-Received: by 2002:a05:620a:44c1:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-914a2d26193mr164011885a.6.1779358866118;
        Thu, 21 May 2026 03:21:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a4101c1sm27619166b.35.2026.05.21.03.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 03:21:05 -0700 (PDT)
Message-ID: <1f8f46c7-8332-44ee-992e-0b9ca1c0ffef@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:21:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] firmware: qcom: scm: Add minidump SRAM support
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
 <20260519171442.1582987-4-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519171442.1582987-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xju4SKPK42-Xavlv6QfwAUUe143WDBC2
X-Proofpoint-GUID: xju4SKPK42-Xavlv6QfwAUUe143WDBC2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEwMiBTYWx0ZWRfX+g15GeSNpLIG
 +mjv7Mnt93MFIr7Yl1d9Tadd40/B5/9NBqomxW9eTe6+8hF0gMGbWv4LpVTiuYroExw8x27xpLn
 ROJJBNy4pCNjdZmYepTM5WY18LKQ3J+3me9ONH1Nf/8CVAvdcRZNYrl6CpKwIwodJH+2lAMnjc8
 drMDIWxLs4HpaO8hnrW4hgkM7rnO/iAHlTPzUjiCYkYsT3qMuzrXtW+R6w/7QsdJmanLg9We3H3
 VlDPv4a3T4BJSzhCnqyAAxhqJxyt7Idj/VnaUycRbkUeBn04TUpUDHYUknGRFB1K4YnzwciUd1O
 NgFTT8E3QL4Z3aUz0G0hLnXkgYTTscF/vcCrNkiN5U6rxQP6hRJBhAUXTH3nDOLEt+R19AIroaV
 Q+yPlO9dzR4vdNpCYgwYbvBWkuG6rU5OLo5Hv3rI+OD+c9tn1aXnq0JUlZ0kk+L2yMRpqrCVO45
 2RZarMV1Lh6GKv+EE4Q==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0edc93 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=y6rW8TDjuTIuaxCCkQgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	TAGGED_FROM(0.00)[bounces-109017-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1D8085A38E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 7:14 PM, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. Before DDR is
> initialised on the warm reset following a crash, firmware reads this
> word to decide if minidump is enabled and collect a minidump and where
> to deliver it (USB upload to a host, or save to local storage).
> 
> The SRAM region is described by a 'sram' phandle on the SCM DT node.
> If the property is absent the feature is silently disabled, keeping
> existing SoCs unaffected.
> 
> Expose a 'minidump_dest' module parameter (default: usb) so the user can
> select the destination. Only the string names "usb" or "storage" are
> accepted; an invalid value is rejected with -EINVAL. Changing the
> destination while minidump mode is already active updates SRAM immediately.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

> +static int qcom_scm_map_minidump_sram(struct device *dev, void __iomem **out)
> +{
> +	struct device_node *np = dev->of_node;
> +	struct device_node *sram_np;
> +	struct resource res;
> +	int ret;
> +
> +	if (!of_property_present(np, "sram"))
> +		return 0;

I think of_parse_phandle() calls this indirectly already

> +
> +	sram_np = of_parse_phandle(np, "sram", 0);
> +	if (!sram_np)
> +		return -EINVAL;
> +
> +	ret = of_address_to_resource(sram_np, 0, &res);
> +	of_node_put(sram_np);
> +	if (ret)
> +		return ret;
> +
> +	if (resource_size(&res) < sizeof(u32)) {
> +		dev_err(dev, "minidump SRAM region too small\n");
> +		return -EINVAL;

I don't know if this is possible in practice

Konrad

