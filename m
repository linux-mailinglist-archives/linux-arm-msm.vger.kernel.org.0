Return-Path: <linux-arm-msm+bounces-118037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XYTvJ42vT2r/mgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:26:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7A2732357
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:26:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N5hEGG3f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hQ4kVR4N;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118037-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118037-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA1653185C1F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 14:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7118C2AD10;
	Thu,  9 Jul 2026 14:07:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1FC1BBBFC
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 14:07:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606042; cv=none; b=tT302A+88EbgewtpEXBFbiaQO9A1CgtTvAyVht75kdHD89idnU8iT/4rJiGY/AO/GlVyIx5ALW+H5gLuVscCdRtWQ5Sha4jr4XFrwgnuKsFmY7WEGs7Lk4uAbLWIcvyH+6MKaXbRPG4tAxEir1d2oppfGT/DtZZzynpIyVgcltA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606042; c=relaxed/simple;
	bh=fWELxgqBDTV6UIy0DqvW2BAFG6PSmXOlOgJYCkZcs/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlQD5YAsfzmWXrdz4LEcm0l56dMR50y/3BVeiBER2vSGULIXjC8rntmAdvP+F5ZFQ+lPzpM3rxwtbA3Q8tN9jbW9NBd1tJuwncKLEtBk+Wed8sId2AwZFqDdAT+x9TTSzfmLlsEBpIdRmi0L3pXVR8rtectMd7yF8zDTICLG6ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5hEGG3f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQ4kVR4N; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Dw5VF1919459
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 14:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=exj1OkBLX7/QojjHNAo08NMH
	7mpLGfvzHV7yrAUqtY8=; b=N5hEGG3fdfcAwydzW4SZux4bNew3BjX8v+/fDKPY
	8fqfeLhkKvYlbP4qtkNa3BUENt3SW5q3z07j/mfl8l6+NIKCvPk8qdYvTwFzs5Hv
	/M6J9nQ62KRY6GJftvTdXB33j/vPbA9UolskL3wAl9qR9h371pBs0nvUBJhJTOko
	YLHcOEB3xGr8CCmKPc1XAC6sCY4TjeXNyhIB5TqboyIT93sVZKzD0EVa2CPpAmS7
	D3GtFFuVgHUmjCTLClUEZVi4mT3bJ3o4Ffhv4QJBj4OCiElNPDn5i3aIfbIUT/Sf
	W4DKwR6r/jOSjskDEy42dv/uLprShpmqqFG5LmrQ+Klkaw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwcky4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 14:07:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c075c1e25so9970571cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783606039; x=1784210839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=exj1OkBLX7/QojjHNAo08NMH7mpLGfvzHV7yrAUqtY8=;
        b=hQ4kVR4NPgPds7xRqnuH174AwQTp7a7OmhaXVSd1rIawACFBpa/7oPaaQJ0Opk6fBl
         f8+p1l8YiZe/cfUFreNd+kwTENZeNisc+CAbJ4U1rm9XHWVWdPo5fUl/eFAgvfEiXARo
         jIcDGeqd+5v/hu2yMGB5VlwUEtIcyJARsywNAfVQ7rJo/WEcWRDlLM3kOck57uCXOeXO
         mGkEyMW5CrY5ofdLeMbRo0PJ6AHrZy0zAuf8B0RisgPBLZzFDOSncVYIQMcCzYgi9bwI
         scS1JcdNw+j76b8Rhou10cSWo6MGx7ouuiS38roWszHTX5NEDjporQTUPHsIy/1D0QdA
         10rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783606039; x=1784210839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exj1OkBLX7/QojjHNAo08NMH7mpLGfvzHV7yrAUqtY8=;
        b=CkpVAjda66nt/TAadAesHOPxTgtVNopZ6CS+18b9tZrjFm5kqiXInR+vyEl0YIwHbQ
         XXF3J9VZdG1XyEhN/6XfVBeggjTrI0d4Pr6iDM0+ajooMerIWHlJ0PzZKZeBPna3PX8s
         GS42zMxM7ER7/Zddc5+Oujm9LDwhbXJYv3mi8H89F+dCQsGFbD1KKEqXwjUWqVgh7rdI
         gbpBrcFeITV+KuNIP9UFDbZ23J1JJJP2WIxVeJmhdDbJ/QeYdD7OTWmAIjB/gBKL1cE8
         B7ELKzyQDZlmAj6WrfzkIE10bxn0mIX+ySWQkPzozGYkMIQ/tkhP/cgpXIh751KhMPYi
         fziQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCpS9h/yipQuI42JkJQVJBBzPCPCPdiVuyObiGGCcjTpSGsqOyztW9SmOdHpJv4d3c1hkOD2otJCpNBosG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0lupfPLxjOZTamHCOHxVaecP6Ty8m7FxUfWZ2AJidbGslRhYI
	5yK+lpImZtLTPtWNC1YLpmY2h/UOaYg9A0iwC2vD6RAKvbiqOD8uydIoStiWjKqwbfl+8J39REz
	VfxFFv2COUDBZOj/tgukVPUoeecw4yVX82F7SvI0ZsRI8Oe3jO2PIOHbL2A+POMwPGscW
X-Gm-Gg: AfdE7cl2Y4QGd8QUeSjxS+KSVOymA2cJ4JsvPGTocYdunVkg8RE2gpSe3A+CZyDbfj6
	2RK4LlYpqF/5SD4AexFWZvp674noMVfKs8XdENOkX/2jJb/omrnJVUBV13Yj+tLEVG0DNvB2v7W
	iQZMGl5U3p68J1Jb/dQQtXPwQS8NCF4vDABIJSNDWaPUhH4erDNi7yTA/3Bws1WS6AAfVQH1Yp/
	z00eazZp6EwKO4I0LEPV8ggVuQFBIKafuipMQcYuWa7PFiIGSBE9DWlh0E82XjHVtlw+zrlj8zL
	vaO6yVygDrttBjvCXArNqv8aZHAFpLU44uvBT5VsOpl97TBcLQdFd2OeVwE9OM03U0+ik4OUybS
	qvcNqBtJlhCR5D8q5Yj0sjA==
X-Received: by 2002:ac8:5f89:0:b0:51c:8fb:fa54 with SMTP id d75a77b69052e-51c8b4d5a86mr74945881cf.57.1783606038992;
        Thu, 09 Jul 2026 07:07:18 -0700 (PDT)
X-Received: by 2002:ac8:5f89:0:b0:51c:8fb:fa54 with SMTP id d75a77b69052e-51c8b4d5a86mr74944871cf.57.1783606038297;
        Thu, 09 Jul 2026 07:07:18 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb705e22sm51620965e9.6.2026.07.09.07.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:07:17 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:07:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Enable first QUPv3 wrapper by
 default
Message-ID: <tm4tyrsmzhbirfgywc5dpqzea5t5emnmyamp6l626mfaxtejsp@slgppnnsj464>
References: <20260709-dts-qcom-eliza-enable-qupv3-1st-v1-1-e9a6904d0dea@oss.qualcomm.com>
 <6f2b72ca-8560-4e69-b971-afdd9e2a7a28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f2b72ca-8560-4e69-b971-afdd9e2a7a28@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNyBTYWx0ZWRfX4luwuD9nWHem
 3IDrv4zdEDSFarmMDE5XKuGpkzy5RiRgufEW+FWMlVwhGrKG+sVroC36ziPR0ulCQS+xL0gyefj
 g5jaY4niCRnChEtv/v2m507C1onQ0HOUGHuwYulh+1Fn8kadOGoYZ30z4mOt9biXqQ99K0ndLz/
 1N1DTqJq8CdD0J+DWYkSwvOwSai7+gCossfNafn98ELJOMjERlbBGOHV+EYXwUXHhIzyiErNWJz
 Dfo4BNAPKh7i0IIovw+cRkgajFPkhNOSVWEp4wWnt+optdqyymtlaaX2pnFVhAzmpH7IdYawRLI
 jGrtX5e8+P9WrkqqHq42ESKC3cIOIE+JfQ+MKt5jxMjOJYKmt04vHpitxL1HVbmCojE7G5hlcKX
 C8lQZYOS+A20QMbca6fPdrIz2itSWuhd19DorMUCA5s1WeelAX3t78kCONlDmOYQXY60DxV6zt9
 UZalfqfSd+IG3peM3hw==
X-Proofpoint-GUID: Ivaq_efoiOVPpI8st-mf-yfUNlNNIyb6
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4fab17 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vxGFvYnQpFAaycP-2XAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Ivaq_efoiOVPpI8st-mf-yfUNlNNIyb6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNyBTYWx0ZWRfX036Yw0sd9maq
 Be5spaxA8+RxBLdERh+XgDcwDJGYJpEA6eqaoTId5UqVgVygoR7H31Kg23DiBr+Av9qph3wnnhS
 nzpKbjSbyuVakFvy/XUl+qhmhHAECXY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118037-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E7A2732357

On 26-07-09 15:08:09, Konrad Dybcio wrote:
> On 7/9/26 11:12 AM, Abel Vesa wrote:
> > Since each serial engine will be enabled as needed in each board dts,
> > there is no point of disabling the first QUPv3 wrapper in SoC dtsi.
> > 
> > So enable it by default. This is also now in line with the other SoCs, and
> > also with the second QUPv3 wrapper.
> > 
> > Fixes: 844807e1f89d ("arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI and LLCC nodes")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> Go ahead and enable both QUP wrappers and both DMA controllers,
> a subset of both is assigned to HLOS by default by the tz config

But the other QUP and both DMA controllers are already enabled by
default.

