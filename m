Return-Path: <linux-arm-msm+bounces-91865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFwIBdZZhGl92gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:50:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D56F0077
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 09:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C20C3002512
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 08:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6917C352F8E;
	Thu,  5 Feb 2026 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qj0pRvr/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0VKapoA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C6732E12D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281425; cv=none; b=YPSEOVrO4YlFneG9HVVqy8/8939Hdb0hEScSxrsTyinhBldQbN3sQkEmGZNPbX+ao7/1pXfszi1mfF6D0LCvjvfTGnQmORkHZseSjm8yuqjIEeQp/pzrutDrjIh+7/Ei/0N6VPlNOu8i/00Sq9JEqNYoWuZ9FiYwhP9A9T2qBlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281425; c=relaxed/simple;
	bh=lMfhic0n6/DzWdKV2OJ94+DchbyFqIE/ZgveGmoy7ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K9osOTxweGcFhaat6PgwQuBfQCmhchOk2sd0QXWE1Y/rJosaDy6CMKY8XY8kz7CBMoXztjGlu4/raQl39G9s4neCu61N+ngDDC7pivYcLJgGXDAukqgubhE/hbArlisfm6g9CfooYP5rP1sKg6pDNJYNDhsYxGnttzBTyWwVX7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qj0pRvr/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0VKapoA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153eJed2641533
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 08:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8qX8UEt+m6DN2gO3Tv3pcDL6T8bCOnlpiaOU7EeAsUQ=; b=Qj0pRvr/JWgs9Lgv
	OGkTv5JbAB2U72Wu2FtU7iYRJQBZUhrILHPgeXOj3tdyzsHRVkaNXIjg18AkUGOZ
	jbunmaR7KfDk++71L5EBKI4DL55wysZ9fBl9IkHG4nTbKjvLiuFcF2kTcwFFDB0f
	zk2t5Oa6HS4GqD+NoFaO60K42zElSCyV7Y+MaFtdfqVbA9+YtG9mgmn6jVEXaJN0
	+RmAeXY1pfAxrNjRu7nazFd2BrK5XYgv2QhArl6jsy0wvzOpMbkRVn/l3NmOhtuL
	a1NwtBDr0nMa258I8eLyN6bOpVGIvljf7bNzBS7J22S9PZmUsiNp0Gv9/xM97E7m
	XLobAw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47qvb2g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:50:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8946ebb51a0so2795396d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 00:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770281423; x=1770886223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8qX8UEt+m6DN2gO3Tv3pcDL6T8bCOnlpiaOU7EeAsUQ=;
        b=j0VKapoAf5jZ5jVCPRxUaXenHPIXs7PS5JeMZvpnu2dfHu9sRECEfcYH+CXN0jutNP
         /gaFajYW7Pr0ngqFI2xZk+sA8yJ81c76yKiXYI/e7tYhoO3eMWaFW43nWyKdRa0VsgJ9
         l2w1D9FUtk9IvcYMgpT5H80mXj87xVBj+VTjWAmUIL+MMzurn4NXK3ZN7XbC1+KHli6g
         ti4iqvKP/SYPQgztyqM7daZ8METdz/IDWqU3B06ibBdRjsfsqnq1FL+/Y1bJ0kliQfwr
         RS/wyM75hEx1K1Ix0OLqYcwxgWTJZYf8VvIiynrd2NHFXEcPhdOxljscvg4sX9RG6CJ3
         sN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281423; x=1770886223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qX8UEt+m6DN2gO3Tv3pcDL6T8bCOnlpiaOU7EeAsUQ=;
        b=Z+RWeFeRRpTZzouzdH1PzxlhvyizjBCGDGW8RUGxJUEq0tadxMKZqd+1bYZcl7x8jc
         STwQmnvpk0NIk21m0KDphy0i3941ATtxIatt3O3dfz0PBxY519LhV/0JBRMC2CEkcv5A
         MPfOopo2BGzzwZPxvj0CCDFY7URtyN0pG+n5GrpvfBTcAapueuVmOdC6MNAMtaa4X3gm
         AvBcQaEn6xWMxYCUGr+dy82daszw/Ob7vZH+8b3CI+YTpu98FmJwP17HCLebA5fy1I1O
         7dxywhzbtCbvEQQ6xpCsHz8KZgW0MAwxFuARA9HffB6Gnps4P/56hkSvWxW+y3+bi8fW
         COxg==
X-Forwarded-Encrypted: i=1; AJvYcCUyS4gXS1uM4MLoAsIRzGPkVk7qFGYLpPvzHuM8REYZV11SSnN0jnl16vS6kMWvfsFDkBgfrtR8c81AcyTj@vger.kernel.org
X-Gm-Message-State: AOJu0YzkNdlsBRww5cdvKgcjZ39rauAEfcfbOzNFY5bg2MjNFKa+uUII
	D16xejFd8Euuc+VPmTCWJlQWTPOlbdWG2goL+vbKg0Rg4rdnDYO1a8h0RJAqijWEI3hKkWKNx9F
	BjbOWZq94lSefoufkr3GK+XY5Jn27M0nOmTl+JScvW30XLQOLUSpybcoXcn/QDRNSXHgA
X-Gm-Gg: AZuq6aLtaFl3LXHWmb2xSGonFgeYrlB/FPEzdU2YBCri++xRIZaJebhow7xZ+hpe46I
	g+d0Fyb9v3TLnSZ6J3jCOh69IiHJ3rjyx9tm6WRzr51dKxRpEhCc9NeYJxQo4WmsX5Frqf2iHct
	urRnvtU6i+bXVxEw7S3C9Bk720M7y8sASkNMi2704gvDiCMDhN0XpLQCiRQjYt0TxysjEwj4Kx+
	N61qD123TKZPoPvoBEQO9dB7zDpQFcwkLDtPS9TunUYPWbte5hMz7vHiBewM0ILyjz2kN2E9QK5
	5tgKYb9RuDRQZzQo2V+XS1tFmwNBEZwROSrsYE1u1CAB/YwlQIeGpWIN9czryuisTmATWeXkWSM
	NbSIPrkvvRPQou2EwEh4InHjvJIJKwZlqjokSswiw21l5ytnjOZkc+dmcSwy5rJaCm5Q=
X-Received: by 2002:a05:620a:468a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8ca3303d992mr488859485a.1.1770281423396;
        Thu, 05 Feb 2026 00:50:23 -0800 (PST)
X-Received: by 2002:a05:620a:468a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8ca3303d992mr488857685a.1.1770281422962;
        Thu, 05 Feb 2026 00:50:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fcd8f17sm207101666b.12.2026.02.05.00.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 00:50:22 -0800 (PST)
Message-ID: <bfba9d62-2741-47b8-8325-2d932c20c9e7@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 09:50:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] of: property: Create devlink between PCI Host bridge and
 Root Port suppliers
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        robh@kernel.org, saravanak@kernel.org
Cc: andersson@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        qiang.yu@oss.qualcomm.com
References: <20260205070640.10653-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260205070640.10653-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GaEaXAXL c=1 sm=1 tr=0 ts=698459d0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yxBm9irkQl15ksekz78A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: nFXBsT2j1fQEzyPOzLSQy152orYk8gGa
X-Proofpoint-ORIG-GUID: nFXBsT2j1fQEzyPOzLSQy152orYk8gGa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2MyBTYWx0ZWRfX8+zeof4cTjZn
 QInybfJplusuR3pBhEFj0ltLi+Arr9WWm8XZO85Ew7+WPle0XJGw58aIgSuGgVB/LAqkZ+uJ6P6
 uQqatk3LTBQY07GUXsXDioW6dVyivdTFgKifufIYOyNSlGcxC51eYmEVX2lPSR/lZ+bdUtGVy29
 BE0H0ca0fGrc/omrbyz6LPk+DZIUmtWLT+HiWXz3OFGOyy9hXstI6fk+Eu9MSTbMiyHLwz0769G
 ViqVrd1JWzpqdGhG8lToUrYh/jsAoAubp6HXsQUmZIWdKublMV9rzT/gE0ZZ23a3fJl+J4wQtsF
 Id5DA2OoOWuFqjbfJ4Z+uXusa48sUMEZFO2yR2b3ZPVDfZkoZe2wJYMohiLSUlsVKwcNql5mIOI
 muWO1LZpTIFj83uG5VS452ArwlQtgD8qT7j9E5xVYIPuFRd+gS6sDfa5Zg0vvd2zQeFhSniz9N0
 KtJkTt9HjZ/xcedhYtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91865-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39D56F0077
X-Rspamd-Action: no action

On 2/5/26 8:06 AM, Manivannan Sadhasivam wrote:
> In the recent times, devicetree started to represent the PCI Host bridge
> supplies like PHY in the Root Port nodes as seen in commit 38fcbfbd4207
> ("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node"). But
> the Host bridge drivers still need to control these supplies as a part of
> their controller initialization/deinitialization sequence.
> 
> So the Host bridge drivers end up parsing the Root Port supplies in their
> probe() and controlled them. A downside to this approach is that the
> devlink dependency between the suppliers and Host bridge is completely
> broken. Due to this, the driver core probes the Host bridge drivers even if
> the suppliers are not ready, causing probe deferrals and setup teardowns in
> probe().
> 
> These probe deferrals sometime happen over 1000 times (as reported in Qcom
> Glymur platform) leading to a waste of CPU resources and increase in boot
> time. So to fix these unnecessary deferrals, create devlink between the
> Host bridge and Root Port suppliers in of_fwnode_add_links(). This will
> allow the driver core to probe the Host bridge drivers only when all Root
> Port suppliers are available.
> 
> Reported-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

[...]

This is not 'required' in bindings and device_type="pci" doesn't uniquely
identify root complexes (as can be seen below).. but I suppose this is the
best delimiter we've got

Perhaps it could be made 'required'?

Konrad

> +		for_each_available_child_of_node_scoped(con_np, child) {
> +			if (of_node_is_type(child, "pci")) {
> +				for_each_property_of_node(child, p)
> +					of_link_property(child, con_np, p->name);
> +			}
> +		}
> +	}
>  
>  	return 0;
>  }

