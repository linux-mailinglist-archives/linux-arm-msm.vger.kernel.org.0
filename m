Return-Path: <linux-arm-msm+bounces-105376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONmdDzJj82le2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:12:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D59104A3E2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BADD3020ABB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 14:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84434429825;
	Thu, 30 Apr 2026 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j2X9oZqP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hX1fFv75"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF26401481
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558312; cv=none; b=cqU3G09GfuO/gA5hcx3GFJ/bV3HQFafALAyYtrAsjLRIuZki+M2YrUb8sEoz/l/FmQTR9ABPDTOjxcJva8JeQLPj6FG830mGljOuimFO3591H/9wPE14oFmyxYDVkb9rgaKo6/x+9fQwZskFev8ei9kyVRp6K5o5hfOjXty2aPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558312; c=relaxed/simple;
	bh=cQcDm+jcQXGu8G7NUBXSCzwRptDfgMeJfNsJ/0RT1fE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sIaoimb1rRVM4HSsgsr+9jX02eWZ8uHQ+Mhu2HLs+Sya1aZgEit0vMjjYgF2fM1UERE7AE8prH8fSrJH7Y82FhzD3XWhNnQ6FeFBoGA6w/e7PWP4+qa6IP6pbVOiILDTYd54B0YeIujRRki5XZeB5qPO0FV0V+VskGd52gVeWR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j2X9oZqP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hX1fFv75; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UArcCt2907475
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6vyYoLTi8GYiSZqan+G11SXyK2akK8tJyikgcHdifI4=; b=j2X9oZqPLz+UHBiP
	RS2Lc2vJBwhQZVagFXd41VwGaatlHgh24H8Wpn2ElgwnhXElKwMj7oUmgZANUVUB
	pLMuJ4qX9NvwAHPUK3vtTtf8Wc9fImzEgL3iuXFXpxmhb1O/Xut4psICF5citegD
	R80JbFWQey/A8lSbPHN1T7J6ccq2UtFTAwmp9hmHBg5s20Xtfqb8GrPBFCLpKVXn
	Gp1wZO/HLfEgin6BTsFKe7GqffLCnP3YoBdduZ2uD5DrgM6tV8+lLhsNchgD4VC6
	iccRY9KfXCcluQhAovGlkwdus0pm0vnQHmAzb0pcsbjvExqokMCIjI0eU0K+kdQs
	+DnKRw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv0pfafff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:11:49 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f71af9dddso59600e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 07:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777558309; x=1778163109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6vyYoLTi8GYiSZqan+G11SXyK2akK8tJyikgcHdifI4=;
        b=hX1fFv75/hClJjLlZaHr4CzbkQXuFiywkcFW8WIBRbDmz1WOpMS3FqI4sKKhTbmmct
         E4B546WFjnOkP/rbekrGSN4b0z1mcM8nFj//rG1MpUD4+4OcpvbFCLKKKhxj2CJ5GeFO
         R75Fu+tpXk4bIK+8nbit+q2HxH7T5RkLeK2aXxQLTtqasC3zKt2YMeAjpqFJ3tFM8nMH
         S1EY//usFQ5DKlgM4ZHHAac99zHzGKSrSNXRXWm1Max9gOQlsSYInE7yZDFh5zn2a2Yf
         TALT5e4YRzE/BNtLoW7NZqJax8OivIdv2fhdNVY9VwZje08PiSnpjLVbR3UhrmbfNeKx
         I8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777558309; x=1778163109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vyYoLTi8GYiSZqan+G11SXyK2akK8tJyikgcHdifI4=;
        b=W0pwYQIaPtkyAxE3vSQv+quSjSxSD44Id2NIJQDt7o/yZUbvkizXdYahvKoE3BvD93
         fgVs0HuGLwa4xTRii3vPL+QmROYSunT+0eiTkUXgQUblFJrdF75xYODZIfWZ5/Gy3AIk
         4wrZLLUOG9CNqQbniNrOkQ6oRjObJYlJq0ma5J7SAfRb3crxTl8nq4SDt1KLuztOUrOx
         b8J9otkmJvsmOI+LkDwfU9QHacq8/3Hoy4o5Ct6r79Swgcv+SyQfY+i4lZUUohIlOcGG
         RbCP2WC7t9eiGG5ADi09UIghHYVu2+uC+X9nn7vQ6Bgaw5tu4i1OWC+xy/8jMZMjAzvJ
         d+wQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Zn/a3t589SMZdAGgLbJr1cf0nrb/0XJpUTVFW7/ERHLVJDzGNIL7AjIx+QZifWzDROJfy5WzTcgHxLlSm@vger.kernel.org
X-Gm-Message-State: AOJu0YyXLJB9JafuTSQL7Y2LgEfZupRbbVEWlMp0CEU+oQ0uvKlDW6cy
	nMrdu2u+VgOM8119nLUHQItRrTlxsPR1WUG5v0yjaREioTIcsd31cO+BowaJ5x/IvTdrIKJ2kIX
	V0fiPDfPg0eqIFGXB010YeNGC/u8fdirlg10QVES6fN2bp+DHB90XdwPgUOoQscw1ac6W
X-Gm-Gg: AeBDiesTQCfrVTKEYwpJpChaAoAN8R2tGuVLF1VK/sQ7aG6GTEW0/Z7xl+qJ7Xo/Zj1
	nXR0DZa0Pud73HE0JAfo5+Gmb30IVHTr29FWe7/DU+udNgTlJ4tJDILXcH9sTRJZPvRqnlt1tB0
	Px9DYwNGRv22JJLegSE/MF8Krt+VkpIbpV7GRsVhvldTJsLEu8/ER+SJU2TmSVg6MtUnPv2hpcX
	5dILna8oJDNK0yTDL4JKiTIjAKD68jbMnQBohrb/YmLQF2sEVfMEyQdjZJleJt9f0wdeDnp6fpC
	PzuVFp51Y1dyHG8sVfNEN+gEt0X7UCt51Pz8FZM8rPWjU6CLaRUPrwWGkxRf7BlJrBTrPzfxBDT
	vBmaEZGzCc419IpTRIvlxZClgIm0ZIHiIeXbjKSp+lpqsANfJgQZ4piDDNLb4Eo8F3Wcqiuwxbq
	a5uglH290VueTq5g==
X-Received: by 2002:ac5:ce0d:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573c96f749amr445993e0c.3.1777558308664;
        Thu, 30 Apr 2026 07:11:48 -0700 (PDT)
X-Received: by 2002:ac5:ce0d:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573c96f749amr445941e0c.3.1777558308167;
        Thu, 30 Apr 2026 07:11:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb98543bf48sm242041966b.41.2026.04.30.07.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:11:47 -0700 (PDT)
Message-ID: <6e46514e-91de-4d1c-8eb0-d1688e0a3821@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 16:11:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: imola: add support for media
 carrier board
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, broonie@kernel.org
Cc: linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
        m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com,
        loic.poulain@oss.qualcomm.com, Riccardo Mereu <r.mereu@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-4-r.mereu.kernel@arduino.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430132140.30369-4-r.mereu.kernel@arduino.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE0NiBTYWx0ZWRfX9VgUtG3LqEiJ
 WoY7PVfupAhPEYILhsyGx3PPqj0lt1jzaHxuhYbs1FQc8nte78eS9+k74SRrxyAKyNe+z0pjst9
 KZUv2pb1Rjv1uwPyWWEtw/TDeFg19kzKqib/NebGdDk05nZ3qg8Jy1YU3vfXr46zqik6B8jYZwQ
 ubGT9z1r18J+YZ5gDa7QbOX2LcWXi48dgoK3cWBQktQlnCfHPo0IT7iCS0V9GwxzP4/zgsc/Czr
 aEN+9CXshNq1mjhUapDttHvEvfp0HHlHjQt5Zgbh5fONuZDCxbSlAf0Qj7IsbYeV3XUnbijwODx
 g/bPk/rFKTK9kSA50GljJa2460tEMVQtUbb5IBrCUCPBsz2Cs1AYSNTxlRD68cA37HVAk55A22h
 TWl0A1F3gEZVth39d+uJ+8AWarkGJt5xxAX63VTujGw/WiG3exM2r4aGNfjDNJAFX5r4SUBgNJ0
 YH0wkH5r+hmsZ9Q/low==
X-Authority-Analysis: v=2.4 cv=Zrnd7d7G c=1 sm=1 tr=0 ts=69f36325 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=fPU3a_ZXxuRe2O7PCEMA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: JeYah7umdd_IMHOdb0wz8i7rIJN6xNsO
X-Proofpoint-GUID: JeYah7umdd_IMHOdb0wz8i7rIJN6xNsO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300146
X-Rspamd-Queue-Id: D59104A3E2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[roeck-us.net,huawei.com,yeah.net,9elements.com,amd.com,analog.com,gmail.com,linux.ibm.com,vger.kernel.org,lists.linux.dev,arduino.cc,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-105376-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,arduino.cc:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/26 3:21 PM, Riccardo Mereu wrote:
> From: Riccardo Mereu <r.mereu@arduino.cc>
> 
> Media Carrier is an expansion board for Arduino UNO Q.
> It adds two CSI connector, one DSI connector, 3 jack connectors for
> headphones, earphone and lineout and 4 RGB LEDs.
> 
> Current devicetree overlays support:
>  - imx219 based cameras (both with 4 lanes and 2 lanes)
>  - Waveshare 5" and 8" touch A DSI displays.
> 
> As can be noticed DTBOs are split and no overlay is performed in the
> Makefile. Overlaying is handled in user-space guiding users to configure
> the system matching what it is connected to the Media Carrier.
> 
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   8 ++
>  ...rrier-media-camera-imx219-csi0-2lanes.dtso |  49 +++++++
>  ...rrier-media-camera-imx219-csi0-4lanes.dtso |  49 +++++++
>  ...rrier-media-camera-imx219-csi1-2lanes.dtso |  49 +++++++
>  ...rrier-media-camera-imx219-csi1-4lanes.dtso |  49 +++++++

Are the 2ln DTs actually useful in practice?
>  ...10-arduino-imola-carrier-media-common.dtsi |  46 ++++++
>  ...a-carrier-media-panel-5in_touch_a-dsi.dtso |  80 +++++++++++
>  ...a-carrier-media-panel-8in_touch_a-dsi.dtso |  80 +++++++++++

The waveshare,dsi-touch-gpio compatible is absent upstream and I
would imagine it'll take a considerable amount of time for that to
change, let's focus on the other bits for now

Konrad

