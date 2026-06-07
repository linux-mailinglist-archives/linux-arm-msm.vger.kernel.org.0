Return-Path: <linux-arm-msm+bounces-111585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z3G6DDO/JWorLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 20:57:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CD3651545
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 20:57:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mDSxtlgc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Lj83Gf1j;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111585-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111585-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 10C193002503
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 18:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7897E3191D6;
	Sun,  7 Jun 2026 18:57:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B500A2F746D
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 18:57:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780858664; cv=none; b=FBX8ng0yIbNY9P5cxv9DsTT2Pdarf3kSsSjMi79ygwqPpsBYWuCeDvb+Th3nLEOWCb3l5fk6/VnXXQiNlPKGRcNEruTyl1y1LF0fvqNIttCO3n/z4FutMtzaWj3R0gLs8UyOoYDB8K47QGrty122KykcYl7RNllRL2WLDph93uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780858664; c=relaxed/simple;
	bh=HE97CYBuZfWh5hCXzbpTHa+42Wpq1Ij1S+0IR0PDwJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZa5VfiVMNM8HZZlN30E3XPc1JscfXdUgPqAx4oaRSp/htRAyfJSQmvdPdR6Lj1S/N+g6IbvCan2iNcxWNZZTaS+SJN8hJv6JWYenzEBP67U3gY428ZNSoXeJ9rjtyVHDikzWL6IVr9cDtQOc1DlB0beIPJzNrb5coIfZlWepxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mDSxtlgc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lj83Gf1j; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Em7IW339112
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 18:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q9Ig/iAfD2ohUcO5DV+Kt0nK
	dPVArZ9Enw9FlmNxziE=; b=mDSxtlgchbWe4fNq2g4RJOWjqZRspBg1jtzieKxH
	zpXqbd0pgH26iYcQU8pjvmLxYCyuyJB6mOfpo/uH1a4cGJL0Bqf/37sz7cgAHAdC
	NG85hDWDhYyGX2CY+kCPqjTOoBd2l8ml/WdePfORySnhpFz6vWAx3FE7WHOtzbXy
	yceI4flKh9zYa9lrKaqhVb4E821f9xuiuK2Zh1ZH8AmYTurwkBujtz87uVPRbeHT
	iGm5BFOkxvXuZLTzzbIJqkk73ldZlhg37S8k3g4ySkADQrCmUALrUU7LEK8yN9yX
	fcnds7Uk7396QU81fiFyyN9y1FjXCBmWWjNGBiG4U3m7CA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgv8c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 18:57:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517afbeda8eso19473301cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 11:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780858661; x=1781463461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q9Ig/iAfD2ohUcO5DV+Kt0nKdPVArZ9Enw9FlmNxziE=;
        b=Lj83Gf1juYT2ZHkEqmlW1aUh37S0x2rU+hA9oku/iB5aVxi8CDXDSYqjjEb1GxRxgI
         WhL+hRABtakxYK+dx0uHeRbff+qLy6tKGoU2np00usBhNihVR1s864I9FmsophJEyn2q
         TDzFkO42LPbr46MHDZHMmcmnNbU0RAQg0cnpPd5Gva9FDAoTXsk71lQV4rWfqKlJQu22
         bQPNLIttWPxqroSdiqK0P4kyXkN2ZsygfkfieZKdVGc6BFGP9iPrjomhw/xhupVOjTsA
         dMQUerkkXqBvi89Rnr3JepjU7mN/mCozYsBbXpGO54LpF2QtjWHdpB/I5Dap/JS2c3E9
         YqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780858661; x=1781463461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9Ig/iAfD2ohUcO5DV+Kt0nKdPVArZ9Enw9FlmNxziE=;
        b=dYJy1rT59RNCYzh/bi1ryzbQcRrTJsgGeiOmdxMHhTCjCjNtPzVurovcN4aOwIrj+P
         o5V+YLdAZKNxZwAmgHtwT/lWRFwHpL+WrofCjq4tpV7Ioa/19WzR0ZAmkCy9C2hIeYf6
         v8scwEYzJnWQ13+2vsAAmgTOTYtDiEmB0fpAlAH4gmTwhE853ITKDDfUwoZM5WH5BnYQ
         Z5FvZsw8mT6/WHPx9cW3p5t0YhgFQPF7Y/BWz2MVLwwlyACK02efj9eQ4G3qO1Uqg816
         afDGXjhaQtq7Nc6g27oVA3ZADDn24XSvrh4tgtfdExSvRa8PxUueTF3HwKgrKPjDGmsY
         Gruw==
X-Forwarded-Encrypted: i=1; AFNElJ9kP2aS0OHG/eEVC1x1xkuDlecaCCNP8puzZznFr8riNk1/ULNWqRstHWtyxN66lmg7qTfMcWYqQX3PofHC@vger.kernel.org
X-Gm-Message-State: AOJu0YxEiqXmJhcQGw5MQcG5ODpwxZj7tegVH8FSN4k8Yq6j93wXKCyO
	w6OK7VtmB2O8sQ4V2Twp1MxNWCXhLuGPLfAi2P9iijEAKHk5PR0oYdF3yhdWQ//Gg+Wy/HSKUhs
	jjeWD1XE42rsADnzqWA1oSaodubq8YIvGlrhDJoABD1CUP6ocoEvIq1Sl2QtGDTDyjI61
X-Gm-Gg: Acq92OFe8LkfUD4ELbynBXHXLwMcLa//oNvTiPf+vLkfIMwJXXPfQHQf1/7K9xRw8Dg
	1jXOB5YVstKqay/U60UCfUZndIjiXOp9yoSzrcSnYguRBO0uVKpzt0+bXfVLHoqilVy+wIwg6dQ
	DbHuFq2DG+gU+Q3P6Tqw7UwAIpOUB3ouKekbjCqtHS9c2S+1H09mHLd1gY4AgfOKO8JM7Vtx6Mm
	XOdrowj9Z7Y+dLzUEzUIgHIoW3OGg91KlSdJMYakKj8KpSX1GfN2zTjCjASc/JPboFzfBirrJHy
	LF9qfRPJ2eRKrAekZHrKq0iw4Ymne+P4zlHjQ3Lad/vQeuoMavdbuoicZWlsqRAomvP9kQyVDvi
	6Vxx4flVYftrpzoJ+0zBKAtG11Z/Orixr3uL5gkHMLqz+2SR+tyuCpYeDGsR/3Rton+MszxWh/N
	8UiZB/9XcVI3Bcqb38Hh1vWgy5262RdmF1RRSYggaskqsj5Q==
X-Received: by 2002:ac8:7f42:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-51795b8ef04mr191324071cf.18.1780858661144;
        Sun, 07 Jun 2026 11:57:41 -0700 (PDT)
X-Received: by 2002:ac8:7f42:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-51795b8ef04mr191323771cf.18.1780858660794;
        Sun, 07 Jun 2026 11:57:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2e9a9esm39513741fa.36.2026.06.07.11.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 11:57:39 -0700 (PDT)
Date: Sun, 7 Jun 2026 21:57:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcm6490-shift-otter: Convert fb to
 use memory-region
Message-ID: <bmvmi5tomnndpmk4aohv3d4guxjfbea4nckljawk6ez7ovz2hk@sshjz2ynd5ba>
References: <20260607-shift8-fb-v1-0-72b9dac25f4a@ixit.cz>
 <20260607-shift8-fb-v1-1-72b9dac25f4a@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-shift8-fb-v1-1-72b9dac25f4a@ixit.cz>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a25bf26 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=NdoN8BoSjOhuqMYtIe4A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: byQUCJc1rxQzEmC7rwXq6jSYJK_VcXcq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE4OSBTYWx0ZWRfXzN4BPedVmkIB
 1nAz/YFFEovUq8mLUtWOlV2L/U+t6sw0QmrYazsHeUBf/YaPNHwXUGy3NvOmyYVep6EV5+flPQ8
 k5s3TwhBhjuo4xLNlXRlMWK1iAJcgPIEP6OvDzt0je2ZEPe6tMej4lvFAHRlg/c6Wp7GTWOd3eP
 DY5cGWv9nPUuLjA+ngNjkqh4QegRIrZO1lmzzcebZppOj7vG743TkKrWDeOILNKG/3eTLbKibir
 QmU6ig2cyC374saIhiOjNDYhd1+93FxkiHIWUrLlymDwmGSCBZ967sIt8dqwGUc10jgn3sm++/J
 khC0shN+iC7Os7uv9CXYvVhpQj8w8Q52BBN7urNTu8oPw9YlUypK0bze5QikNU96qbtsIRzGln9
 dVWyYf9yGYCErFNrUbpDZwXDyi4ZojTyTy3WaXwn/C406RWGWAA4k6U0Sy6yHdcDnzG/WZ/ZO5n
 pbYP+Pm2xxqjhopJiDg==
X-Proofpoint-ORIG-GUID: byQUCJc1rxQzEmC7rwXq6jSYJK_VcXcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070189
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
	TAGGED_FROM(0.00)[bounces-111585-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,ixit.cz:email,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 43CD3651545

On Sun, Jun 07, 2026 at 04:12:18PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Instead of manually specifying reg, reuse the memory region.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

