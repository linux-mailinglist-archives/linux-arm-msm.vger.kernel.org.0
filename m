Return-Path: <linux-arm-msm+bounces-102166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNFjMPEB1WnOzQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:09:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 251483AEDCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6EC93022078
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723BC3B6C00;
	Tue,  7 Apr 2026 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6vtKFvi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JUsrmYsv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD563947AF
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 13:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775567238; cv=none; b=YqW3BIae6uRlwDMYxUPRgGthhiEVK75bteIIr+WeIcj5cFLracA8yuhSId/cQYN42S1bmwfEPz8g4XITKwaAY+3N3aR+N6wEgchMlrkClF3qEt1YpS7hm5/24t3pQDINqJeML7sh1eDxbLDGHWCTves/QqMuh7pK+/WT2ytPrcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775567238; c=relaxed/simple;
	bh=if4a0dZt5o+Js5rWKrjRO6Yoegf2GTe8BpeTLvHP3ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIhcQ5aPhFpgsJaNOKq1buvUZjsUB9D15+iWmwDWNTM+7DqomnfpSztHg+JDQ42VuwUq/D94zuwdBtDxEMroQtFI0FHp3p5NGTzOuEvH8SsFQ9cQilc/J6mu4db+jN2CXCKvE9zmpk4zCNRLPiwgG6VsaXwukiEmHY0r1TH9CoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6vtKFvi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JUsrmYsv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376nH5x3815757
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 13:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3+FbRRZF91Di0ErlZa0qnpdWS8M+hjG9ECkw3xgzzD8=; b=L6vtKFvi0BKAvIus
	Ovaz0JofGQwzOahDSHZaFeXnoe7KLPDcOZHeeVMXh/IuqUpK0UNgoTd+4plPVRva
	9VxnD/YorZDO9lvibGjmJk1nzQPeKBTxF9pmUSbCEiX6btGi1hjyhLI+SRv3gbZr
	pd6BIHnZtvpRY2ihYSQoyrAdt6PKgpkW7Ton7PiDPO+noY8cK4nyjawuyNArovr3
	WoL1qnK0WapjQ4l+JS32hJ5bAcpxb6cwvVB25Wsorp4Lm5HXYV+CS4sPPqqhrPo4
	9m4TXpTFLtCDcI3vR9Ngw5WdjqNOHpTLbgrm+qx/UBtTk8J/N23D2GX4UCguZcZA
	gwawjg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4tudy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:07:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ff04e26bd9so207836137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567235; x=1776172035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+FbRRZF91Di0ErlZa0qnpdWS8M+hjG9ECkw3xgzzD8=;
        b=JUsrmYsvO4O4LzxCze3uePWl7Zo7EROwHNr/3NM2Q6ndFBdZpN3NHSwI7+ZxcDjeeH
         iUYRGk/kRh5mSDZtYEMn9UGBpjT5bszZ9wWQ0MU5qgMOXRSh2Ig94bTVY124qsFb9fSe
         xsUf32ZdGeSE3oKiS1Jo3Y+eHMVkoGSIjZ6zhxPLvv4YfnISQ6aSO/OvzpJRREaH2o06
         F5x1dO/Ga8pth4iu2yP6kJTdmHBijZTUHBmrOb40Z376FO7xd0GwiMld22wX5WUAYMVJ
         DcTXJyQqViLDbbvT8+9HhAXShZZ/9l1RD/yOzQzC9Neo7neydh3U6rhKmeD7G2wcPshx
         iNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567235; x=1776172035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+FbRRZF91Di0ErlZa0qnpdWS8M+hjG9ECkw3xgzzD8=;
        b=f8cNOKmcWkciCUbuDsi/JzJ4hScLjSpMIGV8IM+1cptXNrJpYRAWnoZ/NC5iw88mOh
         2V0QLtdjbvmTDzr7UYi8Assc9VEHMwpm3hajKblKH+XUSR/pb0BeQdVs0xQ4P4907RU+
         3BPP9okR2g1Ncq1gsaIMmBmw8sEGWiAKhIL2wRnuQg2qUIC5dzRkJBe5/xs0+WSN9Aq3
         LwnjndIlsgRbfxA2sDjoTDFrdV9bfs90UmhnbvGaPY9DkykrBPpJlLnbDM0QMYcNkf/T
         RQF5SzusYXM073n3g5I/nf/YP1VWhUZvA44OTWofthTZkodgSNMHDQqhHpO/VlEAtiqw
         NGNw==
X-Forwarded-Encrypted: i=1; AJvYcCVtwr4V4NOgZTRe0WdaJ+7j26TxZs/SyBr4qENIgvUZERFupTLAoEmjoJEu3Lj1gjG2l6YnG8dm4cE8OWU2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg/lzzOjVQJPHt9DL+rVocd8AZ4BGbXi3+7QTZc7DmgxIsE8qx
	AiMpWbE7tDTQlQbFGnjcBry1ncsotsLMDGMl9Z3cV1n9uPywbK/WO0VfhSzZumWqo7eHzp7Jj+E
	zxvC5rRqlQfOPk8HxowqC+3LIN3s4LHH/DCVr8gCAnJ4aJxlVutbz+NqGFB2fOiY/th+k
X-Gm-Gg: AeBDieu6ORlo5WsSBCAODB/SAXEEMgCobz7iZKBNOj2e733OmsdEtgK87QnvZH/DZS3
	to+Gx598ZS1Cs2hJc8pfHvjOl0Pb1Jc5LhNJ296paw4IXASzc6q6vI+XKh2ZeUc42PlfV65VHo2
	lWfFl02h/Q0QdW4pSFZzMeXZgfAypFadEYGJCjBsRkFTzx1WxxMGWoMDIrQicu3jE89HJwsi/r+
	f6pWXEHBRIwh2nue0iwTBELeGHXepYiy6SWvWjIO+FXmY017nDSzf3qqydt2IMPn8SZfPjuEIwR
	iXsrd5OxTiMR3EBJRnFdrWDslA+jc2oAHCjzg9Zh7CZQhrbyk62in0QcDrDIpd5QhSXajQ+QSjz
	ALjNtGxMxTafbLDb3jY5mmVk3umzD0ar6xeyfSZItpRl6zWPTvqwx9d6zY1xcTBW4rB0Z4GM1m3
	goCys=
X-Received: by 2002:a05:6102:225a:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-605a50da5ebmr1992210137.3.1775567235202;
        Tue, 07 Apr 2026 06:07:15 -0700 (PDT)
X-Received: by 2002:a05:6102:225a:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-605a50da5ebmr1992173137.3.1775567234769;
        Tue, 07 Apr 2026 06:07:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec7csm550660466b.14.2026.04.07.06.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 06:07:13 -0700 (PDT)
Message-ID: <fd0919f7-e510-4560-b355-15b86ee9e5a3@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:07:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: milos: Split up uart11 pinctrl
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-4-393322b27c5f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-4-393322b27c5f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d50183 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WCMWw2a6SM-JmIkApqcA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: BhvmrxfuG18thcL28tuZG932czQDxdRF
X-Proofpoint-ORIG-GUID: BhvmrxfuG18thcL28tuZG932czQDxdRF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMyBTYWx0ZWRfX4NI9SZpJtTPO
 fa9+ZWXlN8280NqWyToABGxavYaUVNTvIsNYty7FNribyPonhcl0iKgWixoq3Fju2uI6e5BhpVp
 0sPVWEvxRJSkxi+r6fv8Mwdt67/uYb3e0n0GWelO/mKRGjNbDcnUpZQf45GZj8JlsTco+qNXNXW
 XuJRuhEh2emylQ2smfEfNxbE/KOtkIqhCYEj+xbnMpSFdYBwYYr7JHqSroMv/aEnsU0YFzNWjJ2
 YD65X42K7qVW1EBVI5ivREqYmkSOJiTATDPwIP3oR8kfWDGB8VRykKkN5R9kcpEIZvX0zBW3034
 j8yZLvXcLEGUZjTv1lpJPcMNHkE1L9UkldFKSFZHnFY1DLGYccFGr4AOqzowOE0ecEHtoAPPGgZ
 0PAeoYLQpvCqQEab+uz0LLbx6R9h54a5CrXkVlRT3BKQdZSx+CrUsGj8kzSiFO88Ipm+mbSMgbD
 PUwvvJk4jO/54f2C33g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070123
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102166-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[fairphone.com,kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 251483AEDCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 3:52 PM, Luca Weiss wrote:
> In order to set the pinctrl for the individual CTS, RTS, TX and RX pins,
> split up the pinctrl configuration into 4 nodes so that boards can set
> some properties separately.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

