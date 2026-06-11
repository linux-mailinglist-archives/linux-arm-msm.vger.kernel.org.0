Return-Path: <linux-arm-msm+bounces-112668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pwrSOGB6KmrwqQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:05:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 863D56702DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:05:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GcH+PdUQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dPNQeGhz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112668-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112668-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 21DDC3012204
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6E43749EB;
	Thu, 11 Jun 2026 09:04:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2426392837
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:04:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168697; cv=none; b=uNEGJBE4zOWCj0o5FD8ffVPG6h0ooN6wbkOwp4/B+UJshe5eWYt1F6+ZPH/vi46gMIwnSGZJwur1VY3hTguftg8acWoOwRM0pwuW27y1S//l2NZj+OEEql26fG1dRgJo1HLr3O1sFgYW3DcBDcVoHm7OFCUhijyFCDmZTdpuMXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168697; c=relaxed/simple;
	bh=Ah7Hp7ftJHUPWtLQZ0o+NHG8g+aUB0BccvnJf0PTTVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MoWdteRKwhT3hf8cAmbhz6HpilXGB0JDiJtIoKpm9abamyOW8YQU/SANWYUcyXVh4HIbnvxi/lcKmwxMxKR2kxmsVTzzQx/OUGsswgN4qIAcRo1iPTw56Ietrrm677cIYfvIL4mfZ+MTEDTmytcy1gVYZ4Q2vAnGHqenYs5YnfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GcH+PdUQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dPNQeGhz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GeBd3817363
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	42ytVJQyLSNNdfS3jOnCdpT27ZxKZp4RInVBR5BAPyY=; b=GcH+PdUQYWcC35Tn
	4/cw48A6pCYIIrrLVRliK1ncR5ScUg2SJiV3W1X9JcJNeioridAgQBiZkWK9T2gt
	Ax3JO8tf1mIDXdXx9d/8dqFCcZmoPsHdBafeeBxiojm/nED+uMIAPW6uBo72qWG7
	J74/qMV6VqbpnYSXqoj1Tn6qY/j8evBVdNVt05muRfQ/gtm7hAP+A3Ib+9PMdL5Z
	rAv7aHXObo7bBozu8nrUorD7Iq5JMfiA3AsTb++oL8EUOSCcIzbfzrppXHswPIav
	2DJ7atJYa3TUr2ToMEPZrqZJsyds2JTuSjM4hmdxd4xdSgH7T2iYdFLVs+n4pfQW
	oRwqPA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6utkdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:04:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517865e6219so16769021cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781168694; x=1781773494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42ytVJQyLSNNdfS3jOnCdpT27ZxKZp4RInVBR5BAPyY=;
        b=dPNQeGhz5gb0rphKRglGqAqpVRZQ5KeOZx1Mi+q2NcRCuVlFIA5bAGybUqM9ieM0zd
         1SsrMpSdhesEax5ydNWj2Vu+bWDHQpygcguKrZx3ysWeaVfHm1ruiXzneEBBmFT7F+Gr
         PqJjP7swQNy2GBGKRbiyPHByxpG9+A1FyHqYP5eSe5AFJiQN/C/OV+r7OmeseuR0ESGy
         5++1Qjzo3Bw1BuyEw99KRJNqTIJISWVtDPjS6AFUgBCBQntKiwR83zVjpGgttPPgyVOK
         k0aed6kSGx0Oy4UU89yOJEc9kiNROpEAYOs+njIQYYhfV6S3WLBMFFHk6UsBmCwNU9zc
         K3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168694; x=1781773494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42ytVJQyLSNNdfS3jOnCdpT27ZxKZp4RInVBR5BAPyY=;
        b=Oss/4upL0iRkouVU0Uovz9xC4eEpBbU7A88JBIEj5IoqJYmVR1K9RjsHdCQKRsP4x2
         uC8T8joprbBWncIOKpHa1BqMWCZGLwDESBMmedpPfu8yLwGVAUH8OI0HeYnaRNIje8/V
         TeZbwt/cBOB7Ir9WIJOe66purYBanp5KTUJ3dSSeUFM0IJPhDX7dU2yjI5WoP3+HWq+f
         y/gEkxbS5oVjRzAbLoyw+wYdB+whImLo5bbvE2TdW8wEzINY4IllVSBEhPgjknq4r66t
         YtOg4JtqjUYRNQGSRzTpcKbZuIdvuHpmHVvOLZ1/d/uazT9HqNLe3+xk6XKlEchsRwKf
         jXNw==
X-Gm-Message-State: AOJu0YwrxIyd5jo36NYPY9iRuLYwzLFeLbG9cYhRa56gP2gze1hvCMTR
	KuZ/WWM9qQxjUm56URBk7Oj8XbOPIU3L5uRKvvZEE+KMmw3BUC8RNJB10K5Lz95uIduJiEO/7Fj
	8RuFHFcWE8bcrcPS7oaTEIWHYrISMM72VzP8NIVahHOEkBlvlScHaTjyCdT3aPFz90iXq1swII6
	or
X-Gm-Gg: Acq92OGkTWZiME5/49u+T610nlsXkl+fNPouVhxv0FmV9nPgnhXK6Cr6q1Nloougjo2
	IVdW3GuTfjs4L+rFitBqPn09OfFy0vc7bRXBb7vRCAtHxLRINio69RgYNlNvnk4WFI9nzSDHM9p
	iLU4BT0Tc9EixjLHQ8U5OKXwGyN+sJC9ed4OsGCI962YaIRsHsOzS3jOZ6u3ommD9vV3Prtm6Nb
	Wg6h6mPKnzgMnAbZwLg25mxE89uoZEKjTQOxnlErAUKwAtwU7WYKC1JbGKWTgdXh0rES/M3ckJu
	PuB9WWx3D7PUgXVUc/i7++rtmNMC0tjz4aeXECoU4mn44SQZZe+haSR62LXxwXYDFuNPrlI795y
	kWrNBDuvs0eOcpx+gWkUSaBVu+JRIGxMEK46EYJLdnVlRFHNQEgsCFCa7
X-Received: by 2002:a05:622a:89:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-517ee27fe16mr16805041cf.7.1781168694220;
        Thu, 11 Jun 2026 02:04:54 -0700 (PDT)
X-Received: by 2002:a05:622a:89:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-517ee27fe16mr16804711cf.7.1781168693670;
        Thu, 11 Jun 2026 02:04:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb668c9f4sm35813866b.56.2026.06.11.02.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:04:52 -0700 (PDT)
Message-ID: <1cc052aa-8274-4560-886d-2b821715aa0d@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:04:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] regulator: qcom-refgen: correct the regulator type
 to CURRENT
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
 <20260611-ipq9650_refgen-v2-1-d96a91d5b99e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260611-ipq9650_refgen-v2-1-d96a91d5b99e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2a7a37 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NMBPdCelTQKdMlTKoVgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX2JdD+efH3jMJ
 rTH1whVckcZkUx20P8oOnpRao3elIROfvjI6w+NUoWltUbgNKI1wPpb5dI/VrBIdJNaTWeJ03Ag
 Ara7FJ7NXG3+LJQHbAUgc2/TrmlBlu4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX1X6WKYIB/MMH
 QC5jpSfsBp8xo7S4HN6mF2EsOFLxD7F9RbFT7y+HOIMeyJiUS/6rM9xqhXCmcGBfsfJ6Jy91lNK
 uIHb1IBiFifslD60qDkvlKqZahDGRvP5CYH/p2ATDT3WF4Bnosqo2DpCTKXG6eG6AuP76FN8o/f
 eNZm+dik5o3LWtEUNu3n5qDFSVOwbxgYDRgC+dMzyRMdIAejGZzBBc7h1mNJbQnXD6i4G4glYNr
 qpb2Yys/9Hiu3B73gQW9kFqBYh0UWSMAWMJqQ8pnympBvgsV2Dvn+grVGQA7wQUQC+2bCvvfrOk
 K0FDM7nv59fZmxiCkhVRbRQKY/1NuCrBWtgKdjPwWikvHqWiXH7SJ9U1xuxLt8tp1rcUNETy6/r
 ACOlGI1q/EyFuYZlJt64rkWNI8VSOLEORwVPcmn4BMFosd4SE2sRFNscmreyrChMaEvHuFts3Xb
 lSfLhHw9SHQBwIQUdBA==
X-Proofpoint-GUID: PiY0qU8b4D0pifWxBWoGefYXo-ltRQtE
X-Proofpoint-ORIG-GUID: PiY0qU8b4D0pifWxBWoGefYXo-ltRQtE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112668-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 863D56702DD

On 6/11/26 11:03 AM, Kathiravan Thirumoorthy wrote:
> As per the REFGEN IP team, this block supplies the reference current to
> the PHYs in the SoC. So, correct the regulator type to REGULATOR_CURRENT
> to match with the HW behavior.
> 
> Fixes: 7cbfbe237960 ("regulator: Introduce Qualcomm REFGEN regulator driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

