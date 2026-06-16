Return-Path: <linux-arm-msm+bounces-113292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TicFCVOVMGriUgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:14:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F9568AD8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:14:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WD9Ce+BY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DO2w4ZTG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113292-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113292-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 893E2301588A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D2C8634C;
	Tue, 16 Jun 2026 00:14:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA561DFFB
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:14:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568848; cv=none; b=eaPaWyYxBXh6FlFhoB1ZEuLleS9VsVeBP9DallhuaF+SkCp4KTV5kHRZAmip2oJkurhfm1TEG5ukvxGmjM+DumOjo65aQUf3aB1tJ9Xf2QNKJKN4ia/W54/WBJYM+aZDsV78FtNCyrpa3+oFYYL1ROPfJlg5RR8KVeGW+8ftUyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568848; c=relaxed/simple;
	bh=vA6njvVKQvO+PcQKnWXSk6pTFUZorGi+TZMz/G7i7HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwv+Bdxaso2t8f47JalWOuRugnuyHEo9rhhsiTb9QwSOxbIl8+cfjUgEWztAPEvBV1bR2ZVR0783nv8haT/ddB+mhysFqv2T9HteFdS2C07TmMwqTSEqOhtXe8ea0pdtgZBliAaNKOWM/qASKl7+TOOekEc+R1W2dW5jqhd9hDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WD9Ce+BY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DO2w4ZTG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ2IO81245708
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JnNJHOTIwX4iYYMJUJ/SuFbW
	861fmpZl9xL5fkvctBY=; b=WD9Ce+BYkCAJ1V6rq1IVBUNTHSUsvZAoBFWNeu84
	vAcRKYkNKHyiwlZHNZK2hyMui1eQ/ObWmbd3sLKKJLvxjKbVHzt8H798eOUDszLy
	n0S1GF7KgfGpj0SHuC7LZMXtRZnfhQW/0aY6sM4SKydAyPCcJYGKa0NYBqoBRXFQ
	AmuNWEUWrPuietMbjTTVVK+IDqY1tDr+8Q6+Kpfnh1xLtWV63boSEnfBun1poGU2
	pGQ5pSjjORUV1UPAIXg8MoS1VpA+08/Dqv1DXEczQaSwwsgx3Mi62sJkpm3cxQjZ
	oDRxE1i2MWx7GV0P0A76imbxa0IGawnuRIyTBPFs6PtO2A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf3nuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:14:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ceba6ec0ccso102380586d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568846; x=1782173646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JnNJHOTIwX4iYYMJUJ/SuFbW861fmpZl9xL5fkvctBY=;
        b=DO2w4ZTGOlnEfnq7g0UINuvnYuWJg5HmvY8ikVMGyYXpSXhR1Tu/dArtLOZXkPpXOC
         ZXA35W5uvOn4XSwMwJ6Ftxve7wE8n/9Kk9cDNbdqN3gtC1t8Hmu7knndCRKi/KisFlS4
         eCi+zYQLirv4F0TWdJDUCjQioTjVXkKAmRmyMgPMuiVt4VNn0xlVKFD8KkHjTKp/vB9z
         5CWx8jbdVco9A1wZb43qY/VUccE0LEpXlr4CzCd4M/Q2Ysx9EZm1GcW6D37psckiqqiB
         H6B+/434D38Kb+SGaP4B3Pq9fTQzbATiRmPyBUzqh7zrN7NVlGSjVNKWxK7Secl6fp26
         BWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568846; x=1782173646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnNJHOTIwX4iYYMJUJ/SuFbW861fmpZl9xL5fkvctBY=;
        b=iptpS142N/JyDiG1kiaqqyJ5gC+BJIggSu9JV84wICKp9G3NaWukMij96kO+tf93Rj
         rNNBuRJj3rgIzOwDdJRRwW6RbAlIHBZIIPzh9FK26CIbQ3SoKuN76xOLiS7Ogy3QyBw7
         2P51gMTrfty9fCwjjJhFrvkIeERWXl7Xvd1ide2bO/jj00eITv8I7WgvyJiAGQMj6ELb
         EEBZ2KydQzRepKFNOiCUJdh7agDZBCaUvZKDW2otCxrZ44fIhkllsh+BJS6KezUFv33a
         KA68HC6lF9J7oj7CnSKRdK0ZR/dQ7wNCYBy76nkSpzmDZqTglswWpWIIkbtqfFTANpZb
         vR8A==
X-Forwarded-Encrypted: i=1; AFNElJ/NiDLpNv07Od0834NmpFQXMNS6JBYZQ0whi9tsBQaXx+cC+nFFexz5f2QFTAmHhBuUJujyIy4akOOf0JV8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+6fSXibtRZYIilloyx8tkKV3CFkan8CpFVGrsCbGK+RhrfES2
	UU65NfcHj90cS8JcAl3OsajT9jX/XwZU0WpuuwphJ2yakrY6xVU1X88aSsNlCeWMz0rKngnOrIk
	urOoZBRODxu6TQdnDFoca3e+hp2HI8x1/WBhGZgHCSrz0e80G3WDrW0Pu/FSg2WKNsEB2
X-Gm-Gg: Acq92OHH8MkjNYgcR2rH+j/UohupHHXoPBroPH0YCK27ndi0IM8FpcPsN/wkU/Iv/Nj
	Lr4n9T4qDKSUd8ISCycEYsSkdUyiooR/jKWpZDByISRUxzG2t1OAejgfamH1gdDzh9W0mM3bXk/
	GaBA6E4fXY1MC4jn6Ft4Cf4H36SmJVz8jxPK9LTo+3ySNZxikpJY3ooaZR/cYZbqzjx+5H7P5cO
	yzeF0e40hRBGI+SRwrV7h3XDjiF1lF1UcYd8VxSxXHKV228DtZxRIR/U/N50c+or3bxhQv0Za5i
	ZU3Jkir83FwDvnI4yeT3qZ2WNroINYNJV//PJB1rg0KHFVKNTdlpzbqwxI1/8fIWrdixKyrpnxi
	WGymzoLTmGOW8ECLKaFE4324VcKUGy8boolYjDNdmeL1m7oRZuEGjkkFW/LMJ7bTjTL4hrrZTnr
	Nc5PiwQ0f/HA+m7csCOOV9bt2v6GHKmq87oNg=
X-Received: by 2002:a05:620a:4056:b0:915:db15:a24c with SMTP id af79cd13be357-917f15716admr1886330285a.37.1781568845485;
        Mon, 15 Jun 2026 17:14:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4056:b0:915:db15:a24c with SMTP id af79cd13be357-917f15716admr1886324085a.37.1781568845010;
        Mon, 15 Jun 2026 17:14:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1715d4sm3038584e87.34.2026.06.15.17.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:14:02 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:14:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sc8180x-primus: Rename regulator
 nodes
Message-ID: <tgv2ebvv2fzs5q3fcyc74t6ctppx7ktu6krrgkjie6fa4tscky@ttbskwbesqum>
References: <20260615-topic-8180_disp_power-v1-0-18d36b548c48@oss.qualcomm.com>
 <20260615-topic-8180_disp_power-v1-1-18d36b548c48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-topic-8180_disp_power-v1-1-18d36b548c48@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a30954e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=JkdAgLO8MhltecbaccIA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 3A26K7QCa45qaunBovjTq5cmtd5weOPv
X-Proofpoint-ORIG-GUID: 3A26K7QCa45qaunBovjTq5cmtd5weOPv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMCBTYWx0ZWRfX/8ctpVr59rFf
 vpum0tzeWsq34PBcii6zUYbg3IAlBBtR6TToMF2ERTvgDB7ycSmQQ80+YruaARjEuTer3EHjJgf
 TyBBE3/xJVGk7vXw3uLk1aUgUhiSCwE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMCBTYWx0ZWRfX0Nd+RWIJhCRb
 poPm6cbvdyNPONmLLnzAraabx3EfkGhebCBikh55E6wx2tLzIzUw+d4XVQWWIh3WqlOaqMviBGT
 mHGFTh1lTyBAxqmd6zHSiVRjoEq21Da7jF/JU5VZeGgt1pztylSL/DGBTypJzxIFs5mBNVRZ5Vk
 EGioZDAwD+lzVTWcakvdwu5Q89z+beQVFPitsl5ujYepm3D9W9GaYd69qz741RSi6AZLp06Cmei
 jFvlGPGq5ApfJEwdX/+DvstsFw7ZUkTEqAQ1N1V449IDZwadb4dGxVj7/H0XRV/mIr/l4Zm4HG7
 v02ERJc6sJILa5C9AdaoVptHVvMoCDLz9AfTnKLQX/8cSyq2tIego/S545essucfCnVL+7rYMlW
 n0N+3uEGaXn9mhd2qagL3RVm3brBXcqTGTtjtntCsRfqPBngtaMpuaAd3YwxcSoN45jlckFvhh+
 9eyhFFS/sq5G8QObNJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160000
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113292-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ttbskwbesqum:mid];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80F9568AD8F

On Mon, Jun 15, 2026 at 04:22:04PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The nodes would be sorted correctly, if their names started with
> "regulator-" (which is the style used in the latest submissions).
> Touch that up.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x-primus.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

