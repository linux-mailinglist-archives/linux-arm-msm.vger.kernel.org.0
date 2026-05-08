Return-Path: <linux-arm-msm+bounces-106635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP7qMOu7/WmOiQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:33:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 114264F50CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58CC6301187C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E148B319851;
	Fri,  8 May 2026 10:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3cNzZTy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D43va9CY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A55C230BE9
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236368; cv=none; b=m63tbfi9JHfbjvNM0TaDmGhk+AIjSnM0O0qMJdIwwbXactxWuvQ9NCN2ueATpabj/c++ARYhi0iIuAgwcXhllgcYfWgD52lNzQzyru8J5UmMLnbH8bDOyKD3LcZPFnUxXy0hVJSF9OF5d1V7P8sMtm3PSgpFnfidYv/lFEQFN+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236368; c=relaxed/simple;
	bh=XFgOhQSea8H/x0Y1jr/TE2OHafMyIAqEOhW7qRyIjKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L2LfO/NKWSdUTWwdIyh+85YFMP4pQnnB6ncrheNrTxxdWp4ZEyXgvlym7zQLfriDO2v6x9zQXey/bl9HUp4tR8A31Ns6X9F5rfZBHoklHKQcCirOE67txT+T4aFNQuHBbk5IhWdhLr9GkUHIFT0Rs+9uUr3/alTd3wsnd37We6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3cNzZTy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D43va9CY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6488Jg8g2384114
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	88KTNTZQBYZHxyZCHSKo558FfLLokQHJQxk8gQgi94s=; b=Y3cNzZTyONFzI6nD
	RRoYSXq4Yo6i/4bvOB0el/qeSnOg0s48t3R5isRqEWv3KtnoXaUgueHiw7OJV5s2
	WVNKeB+OZ73vAKO+nb2ORPICMlF1bTlWNZDW5IzajqNlhLY/nmUuVSFC4qIjmz3x
	5Uzur8ETia0DEe54EAzf1TpCli6lunwWBAtsnqtwYwWLdK0Mif448/97sM5uUaHh
	HdhoCgkkfU+F9Wsw1/8uHai2Mc0vfkgW3eOM5j2I9avOy5b07oZYObgFM1eafnbu
	O6EVEqzDaXPdHJW8QmMMrx64WAkIWKGsxSmt4u/fhGuU8pomyeFptQqPm9cd+KBs
	gxd1IQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwuknax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:32:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d45ebdbc9fso50159785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778236366; x=1778841166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=88KTNTZQBYZHxyZCHSKo558FfLLokQHJQxk8gQgi94s=;
        b=D43va9CYoyrGrUlJDN98ImOIOjlRASiZf/2OL1iCwZ6QU1GsTnPsfJU9i94r9EopeX
         32PXmEuT2gNk3cGiBe0noUGQ6ixDSmirYY7k0E3ibdc1P8HPOcVbO3KhRhg+xfNaPbFe
         eeo0mCMOc5GcxqWwpsWbHeyaDhfHpHTLlLH/3UEB2wjh+GLE+hBwFid2Pw4XPYujJBrn
         b0W4ETU7ZbWiqmWYu0YvDusbQtzvF7jn9cCP2KRLy3sk1kozEOG9M6GgLgFzGIH1NabJ
         QBMFE0nXcgESdr2TGAZc6oHbEvnNbjcSbtxaJlmqUsEeHDnTgop2LjnqIOhdiDwWRRdZ
         tDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236366; x=1778841166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88KTNTZQBYZHxyZCHSKo558FfLLokQHJQxk8gQgi94s=;
        b=lp8MRyI4c3Un03p87cIRxDck/eTV2mBijHpaOWMbKEOt7Bn9Y9zqLfB2RawhYmmG20
         WfsTZ0vQN0bF4Mq4VAkg2okP6ShXTHYH+PEFE8tZSVFr6AMSTTL+9RpNF8cmx8UMhFes
         KU6RQQJbS+wTvByUnCfQkTfetreLnBarJ0kshasNsHO9CSOr55vLaFJfU/RibOxhUHV0
         b+SJ3I75ZW4BZlfNRjNrLqg2HCTWHXzmPrwww8K3LIv2nDsoDan4mcef3spdBgReqe7/
         3Z+16MrrA20w1F6lsMt8TcL8ITCCFEvtD/Ia7X+Bp5CD1kCZTrCMgbyVF5PelQRnZ2aP
         ZzYw==
X-Forwarded-Encrypted: i=1; AFNElJ9o4m5sh7VANc+mFOKuXFpbAqYE44F+qorlzszcbvP4L2K7CtIqxE8V6dtn1zvizsGNlpeZvXZtnBhm6X6T@vger.kernel.org
X-Gm-Message-State: AOJu0YyRc5kfjS63xZRF8iqJG7cwr+aCaBVQh5/obCtGjEVDzWnanPD1
	IBk51gU4r4J5nKZwDgzbXXHexCGVP4oI1M8owhLE+sM69ua3mrsniQCcJb6zmsEWKQxyI8E4F+T
	a+3fTpaQ30Q1LUanvcSPWWcLHjCTInXTawD0Vuek3gqQTjBg8ZLyUg2iIXcJvyi8chCCo6gVFxl
	Q1
X-Gm-Gg: AeBDieu/otbfafDZVXVx8alaTK+w+IZ/IbXJ2xki41/iPGLQkA6+pmMS5Le/Joajvae
	zuZMYhkj6pjZADYBj+zk4b6qCEcB6tYUzgXWYu+BoHsi/zmA0QPZEeVx9C8k6Uz7tjP1mOVjc7/
	ob7VHR8Q3mKdl30oFmuKgcx9gXrGuEBhHNKHx6qNskkh2+Z0RLeJm++xOXtBaIHU7+jTSnMRFh0
	moxZEQxSX51F9Y53JTSrZyt+w3DyKKQnXx0wygqj0lV6O88gxjTYniLbpVi+beknqTCRT/gvDhu
	4TYDKMVkYpJ1DbGfKbQCBMSYfkGFijravJJc+RYYV3+nEEAgEK1AJtehyFy9RVrgPzvx9EL5RGi
	+nMujksUMTaa68st9Y77YtT8NnBr4Gh+FymGtV/sJ5W8jGLtxnKczTDu5gSIFuXm+3qZa8zYC7f
	GRIao=
X-Received: by 2002:a05:620a:469e:b0:8f8:6b36:fad3 with SMTP id af79cd13be357-904d78a863cmr1223117985a.8.1778236365743;
        Fri, 08 May 2026 03:32:45 -0700 (PDT)
X-Received: by 2002:a05:620a:469e:b0:8f8:6b36:fad3 with SMTP id af79cd13be357-904d78a863cmr1223116085a.8.1778236365283;
        Fri, 08 May 2026 03:32:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3ba35sm509875a12.2.2026.05.08.03.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:32:43 -0700 (PDT)
Message-ID: <fa5c5ed6-afd3-4e5d-80bb-921d6f96dfac@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:32:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of: property: Create devlink between PCI Host bridge
 and Root Port supplies
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        robh@kernel.org, saravanak@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        qiang.yu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20260506075625.8490-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260506075625.8490-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qdwXRifXnTR2U7xqPiowV5M7q2KKS0L4
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fdbbce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8Pzyt-o0a4R5NFuvPhkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwOSBTYWx0ZWRfXwegbjkHQqGA2
 cYgZfJc1XjkZf9+SujKo8Y120Kn2nTjwE2rki/KibH9UPoEiNZVHIQ/fAXecNSgjKff5f3Pi21k
 7+vKyLhBHmJjpxhSFAT6LKoTpPlScCRCwJMw5e1fm2QilsLblfrgYP5nUDsKP/RSFmzLgGTA8Wi
 o0JS4Tl91HtFMUW2DNXaKdeoaFuIy6SY5cmCDQIeSUntdGF4r6bHZ6vD0SF7496IiKxrEdF2o3j
 1iVbKQxnQkoLcVY/TWC18OPJD94dwf9kCVLgfW6/KC3Mpe7UxNyyND7aQBYfmBctPN6Uy7spJEw
 gTjvOMubt3wQnRWcwMCKY5pqiKgcRwSRkT7wBiB/LJtM5Mi+Mr+SWDaKgw3HWk/4115BuOBRnWu
 FGJa6p8EowvWkAsV72bryWzSXr3VeA0nZqkkdH1E41X6JY9VnNbhjE3ViJt4ocd87YdoS64hegX
 5BlidDRXXHHn5qxio9w==
X-Proofpoint-GUID: qdwXRifXnTR2U7xqPiowV5M7q2KKS0L4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080109
X-Rspamd-Queue-Id: 114264F50CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106635-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/6/26 9:56 AM, Manivannan Sadhasivam wrote:
> Recently, devicetree started to represent the PCI Host bridge supplies like
> PHY in the Root Port nodes as seen in commit 38fcbfbd4207
> ("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node"). But
> the Host bridge drivers still control the Root Port supplies as a part of
> their controller initialization/deinitialization sequence.
> 
> So the Host bridge drivers end up parsing the Root Port supplies in their
> probe() and control them. A downside to this approach is that the devlink
> dependency between the suppliers and Host bridge is completely broken. Due
> to this, the driver core probes the Host bridge drivers even if the
> supplies are not ready, causing probe deferrals and setup teardowns in
> Host bridge probe().
> 
> These probe deferrals sometime happen over 1000 times (as reported in Qcom
> Glymur platform) leading to a waste of CPU resources and increase in boot
> time. So to fix these unnecessary deferrals, create devlink between the
> Host bridge and Root Port supplies in of_fwnode_add_links(). This will
> allow the driver core to probe the Host bridge drivers only when all Root
> Port supplies are available.
> 
> Reported-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

[...]

> +	/*
> +	 * Since the host bridge drivers parse and control the Root Port
> +	 * supplies, create a devlink between host bridge and Root Port
> +	 * supplies. This will prevent the host bridge drivers from being
> +	 * probed before the supplies become available.
> +	 *
> +	 * For checking the host bridge node, first ensure that it is a PCI node
> +	 * and its parent is not a PCI node. Only host bridge nodes will have
> +	 * this structure.
> +	 */
> +	if (of_node_is_type(con_np, "pci") && !of_node_is_type(con_np->parent, "pci")) {
> +		for_each_available_child_of_node_scoped(con_np, child) {
> +			if (of_node_is_type(child, "pci")) {

Doesn't this go a level too deep now? (a change vs v1)

for example, in x1e80100.dtsi:

con_np = &pcie3_port0
con_np->parent = &pcie3

And I think the code now looks for device(such that device_type="pci")
*under* &pcie3_port0

Konrad

> +				for_each_property_of_node(child, p)
> +					of_link_property(child, con_np, p->name);
> +			}
> +		}
> +	}
>  
>  	return 0;
>  }

