Return-Path: <linux-arm-msm+bounces-90965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MTDKmfxeWnT1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:22:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4EBA03EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 128B23035D41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A05345CA1;
	Wed, 28 Jan 2026 11:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVGNQAqE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/jx4RyX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CFD33CE80
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599264; cv=none; b=qhotP23/Q5Yq38og/9FE+vS2e7ucbhMK8145P2bzGD8dBfvmBapESD16ykltjcgZC6A2RoYYq8EIfwi9/O9BZRYhgN/siz4/f1RT1cFP2dmDQM5Rct6ALlRm1/+5HTp4uRSseeA+K3gEFS69/Gh1YCtZn2LqgG5u8vmZTtXqoqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599264; c=relaxed/simple;
	bh=0qnHLqAs5qKXRZ3SwSRRXmZ/pwA2WYkJLsmOPNdmiTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFBOqCU/NFGJEiafosENSV3315qbXZBn/JXvCaMm4yuhv69+K10NZ8ubNtq7n8t3Uepffdaqw461KZ2mp0L+yKqjxy8JPQZMa4XRIyyvN8sH0vdbx1JDqQMxflOVZ0XHUT3wP2JScIpJXtXfyCCRnBJZSlQ6FW9/SiURlddEWno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVGNQAqE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/jx4RyX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S928iY811663
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1g2tc08NYFOW9PyN0Q/fD1WgNK60ygQO4ur4eDmhFgk=; b=OVGNQAqEyJXdmDbO
	aX2gznPXCvBCwLJ4xK/OpqjbaCvvSwc1KeNGm/O01eQWMAlYDlKB9OJALSBfeL4r
	9xtn/GECQXB+R9N2zUluP7CwdvXl62t0TYrydk8Hucqk6htd6HktYD+XRIITjTmf
	xccgtRCt1vWAPxHQkm/RVAaCaOGUwwEkvgnSIZbMorPoTOgOqO/j2RaWBHGw62jG
	ri/Oo1v52yjuh8kj/HMK+NQZHy4gT5GrifNZGVKnknxs0OLYqWrawc5RDHl+cGPM
	nl6sOXory+jz3KDsHJ3c03uUOeRdbMJJRHuBarobuF6wiaYcpcbjbtNPwVEfOL+Y
	BlD9Zw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbj7kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:21:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89481f822aeso19779696d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769599261; x=1770204061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1g2tc08NYFOW9PyN0Q/fD1WgNK60ygQO4ur4eDmhFgk=;
        b=g/jx4RyXoh3QRzM4Uipsx7+oDExNOELAv9PrLSSXG/soQdhPFB1XBHMDosPk0ThBqb
         uT8MWt1Qz/R/sddO89dmHwtrwYPwnsgg9Imd1C5jXBT6TVd9Ix/zVYU0boxDCv4Dm3ZZ
         CqJfxpAAKe6A9yr3k9GtatX+tK0Lxyy+iVkzyh1xwflHrb+CpbgzojDm9tH7h7BGqduL
         zw0ENELZ3qgf1H2XJpdETphAKPwfrpSaHsYOqvQjzC+Yeqa81uZ15rgnuO5lhA4DmxAN
         ESbP5rXohrNLc5uYMnE0bio0qyUh893LahXogR8kthDkE521YSR2NuOq/TQHrTbn2V9C
         xBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599261; x=1770204061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1g2tc08NYFOW9PyN0Q/fD1WgNK60ygQO4ur4eDmhFgk=;
        b=mW0ahZ3fahBMwwTuigIAnKxcRkYdNGu9kKXsXn3Iop3VHPYCLviPIUraTOxusqCmHC
         IFnLy0otlOaNlGa8DRHK9gI2r4f8M20oIEQ9QAzugQfZOGrVnzO9V8bFTb1GX/n4OrFG
         Djrq9YoY4EcTJm+cdIiv1UhBy6demjXA+QNPTt8g+zxGiKf50JP1KijG6rAP8u+o0UWF
         eL0G950BmxChqxYbmWYvl9wUZewtQ7NT/m8tmfRm0fapK8YL6brY+e7JaHRPyelqnL+N
         Png+fP9zWkdLAZgIDlkKO+ZbH0yyC3wfUtz34ZBUlHyXvCe4M74cu0dj2H9Bo3MI5691
         r2PQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6bv3ZgHux6N0FN/35suysKLUDiP68H09eVAuupD7CxcAiz+7kzdXdCt529x/822zoWRB1II3ciTV5JTiL@vger.kernel.org
X-Gm-Message-State: AOJu0YwG6XU+qlKl45MTLpGT/LT3oVXtZTw+GVAEAuCugwEtFLuAyCjx
	C1wRYD9EDsdVQm5d70tP2zhr8dfV3qxUWudj4Y+ZH/EFaGTlobV64rBLPJxC5kSNs8rhCDOVcTC
	OvpQzaCTHjkjgwvNdV4rNesqTmIxpr8sMyaz1hDza6c91btmFmefqP5Cqc9kgUmqe12Rt
X-Gm-Gg: AZuq6aJ6mt9nU8u9J1W+/VW4DW/Rz4FHYaqayG47f/MXOomoToZN0SOGRoQd+YldQF+
	lazjosx8VgAZ/bsVfI+IfOXx9wmT1ut0BDWZK6WgeHJt1eBZfe06JZ+7lxEu4f+aq+ltrOBMvc4
	vbJBGQUAIhY2J4/dDBrW7ByvultVGmznw5WIlF6SunMALRfox3+R4szI01mSnWF6EuNJM4nBKwE
	7SI6/SsIj5xlJcass6llBam3A/KK+QR7ddVFAnEcHUQ2qgATEjvgeA16yjlEXWCplmexE/Prtlz
	nv1rv1pweUz0bFcQ4sAhGII/O2wAvo5Yvv+X+MnaOQ42qSIaGA7CrPBta4tlu2hciSLD0Mr9GXT
	GSKjkx0CKNeehn7ht1dUzq+9YNGOUQCMI5zBReP9NwGog8C+V1IdfrjRuZhitGU/iMYw=
X-Received: by 2002:a05:6214:5c92:b0:795:c55c:87de with SMTP id 6a1803df08f44-894d786e265mr9868396d6.5.1769599260745;
        Wed, 28 Jan 2026 03:21:00 -0800 (PST)
X-Received: by 2002:a05:6214:5c92:b0:795:c55c:87de with SMTP id 6a1803df08f44-894d786e265mr9867946d6.5.1769599260101;
        Wed, 28 Jan 2026 03:21:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b44527eesm1422612a12.9.2026.01.28.03.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 03:20:59 -0800 (PST)
Message-ID: <56b686d8-d526-4e11-9b5b-b98e4f1f72d0@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:20:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sm8650: Add sound DAI prefix for
 DP
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: osxVsp1aUobzhs6XrpjX5E7dkUdTpSyY
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=6979f11d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=UpTyAFhicMDBmGaZp7IA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: osxVsp1aUobzhs6XrpjX5E7dkUdTpSyY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5MiBTYWx0ZWRfX4F/z/F6wv0Ew
 SqaoXWaTg4+D9k5gUKCyffPVIhi7Zghqhg8t+Sq3F69tdOQSNLmJcjL5V9WHfjSAGOFKx1RDchD
 FaH8ghAFf136yQ+i5CC9JvF33RpBYumX4ySBgMh0V/lteffpFMA0n4szJFrgHE1HIhSNoKIh/P1
 +wfAcClPtrnJQ4pUC+sCC6haXSNW5ENLgkgiaMyVtRIkcwQVvk8nMSttIC23zpmN3CC2+Nrh4Y4
 fh8iV5sfG5w4zzoov6KWSPt5zOyiFd09B2fiEAsuv2LzjuX1guG4QOuv5NtSWP0kAYK2A4/0v0U
 7eklAEp22ryK/k5AWqdD1VLFEehuZViR9oXRHp3iJUpX6X/Wyja1UTmAuym1+uQ6BH/af6IIshi
 I2pnAG7mP5QGSbBdt45QWUUqGgBZjCm83nNbfZpFy8fk625b1lMafJHrd84Vdxsb5SAq9nzgTYo
 ctPs5iTcV+6VIV4C79g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90965-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A4EBA03EC
X-Rspamd-Action: no action

On 1/27/26 10:57 AM, Neil Armstrong wrote:
> Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
> controller, need to add dedicated prefix for these mixers to avoid
> conflicts and to allow ALSA to properly configure given instance.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

