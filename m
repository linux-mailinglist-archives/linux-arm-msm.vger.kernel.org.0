Return-Path: <linux-arm-msm+bounces-106283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C2CIxtH/GkkNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:02:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0344E4711
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 934923015D05
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51AB32ED4E;
	Thu,  7 May 2026 08:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMA9nIsL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fHM/21RK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3739326928
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778140952; cv=none; b=Uo9PSHRpM0jFjiYsb/TRQG9n2/nOvU5/OoDoB0w2eWnCcNAv1HPVpbWysrKqzCZ9Qz2RYarAhpqTXU9qtl8xNGxLOgeE3k2lqi5pHgpKbDbQn3wmUjXg9Uh31g5jlb7gl5rwQmZV38cQaonTve11D2yyL2IskGKNJGSOrLGKwwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778140952; c=relaxed/simple;
	bh=fWCWn4DKAbxJbMQ55/WJyCf/z5nsIopkXBwEjkA/RCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBDtuRvVQJmhbhlOG+AVwe3e84Mgu/ECRpyW1tNBLnOnUqMK0JU23iuACEBDrXWG4caw/HRoOKV+KurZCjerCgjeRt1EwhhGqFJ8qQM7ok7s/G9u+oL+fDSi0BGmTWQ9vTJrHsq6hiZA/IaezzP6HVVC6HELkz8mKSc/7vqm004=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMA9nIsL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fHM/21RK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475wvQA1927314
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 08:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uDM5x0G3BeJBlZvuzxy44IohP/P8rL00g506vuvpl4c=; b=bMA9nIsLUBpSoodC
	d0tMJPtvfYgT921+6rsG9vWTxr8oGs7wPHYi4ZLz/iZ25je3yN7kWnwVtZ5f9OdM
	FfTXOxvBsvhG1rFYifyuVQJG5ore47/MtqRWi/afr9KKdvuKtPmtM9Sgan1diGa3
	fHqrupKxypWKEZKlfxEKPx0J4GuimDPnjeNblQlSc/KVCDJOXbHJNwBD7mw75vX4
	t4u7+nkrvD64oJNB6ZY/6jyb5oX98BDb6YqMFQhApIqf2frM/nY3F3FZj7SKh5y8
	J2UT6ZyNo+fhh1nKcIVjivqZUrbkCdoIc+nttc38cDZeQBOjYK8gdpNgUri/nb3j
	H20bHQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g8f5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:02:31 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5753c3390b3so77868e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778140950; x=1778745750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uDM5x0G3BeJBlZvuzxy44IohP/P8rL00g506vuvpl4c=;
        b=fHM/21RK2hhpD20ygkPOtIBMw41B6dUDGFRKzOW2lkzUay05lEZpfyD9mSlOhlG94V
         7fvjpCg4egORH+zv8xvfT1VN1Vt7qXhJbgWI/ydKahL4yfefQqlgWcvkxdLGeAh6Z6x+
         jQZFsbV7CuIb8RgRejlhrzQR4hFKVjTGJIuJ+GQG+4XHtVkC03CNQXt168zlrsNWM8hm
         mwpSQupatwQzbhBj1QtPKVDov+2psZb+QqI3ammlgF0ZRJqRsoMaW2qi/t+7e4k4Xywo
         PZt/IndBAfVu9hd0PrayejXkqsoDjk7wtfWjag52QGPyFPZx1WhJijmtX232n2F/HBLU
         tV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778140950; x=1778745750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDM5x0G3BeJBlZvuzxy44IohP/P8rL00g506vuvpl4c=;
        b=rrGfqqRPOcYRFMvu+l2K1cnNj76DI1gCxvv+m6zUqgYYYOdcuKk1McA8++2SkbmM63
         iV1gm/cj2gvKSAZ27vpzTf+pG+ipY6/K1qNUDKHVyblgGuEn05bz2KeX6U7IEYvrSkoW
         Xq7ePMzwFsYFJSTFILoWFRMBtuZJGLDDkJgtEUH23GZVxISqe1GuUWNFyNjdA8LBhqTi
         01spsbU39dW78tysNVxT2PB9/chE4Psj8GTJtcDCZHQjS0ocyBebtkQbvfmOolxMJPUP
         15q82lftkkXmJm8UjMK5pCpJpUCDreiA8Rw31wALj5Q0dPZ0G3mvGO1ZLzaSIuFMIV8L
         ha+w==
X-Forwarded-Encrypted: i=1; AFNElJ91DQFhAWTkmYKbCUhGij0rNyZR5RKG3WSXgHPP2iyW6O5VSzWqzOs61fxdqDSke2kforusXwkk1ViSt0On@vger.kernel.org
X-Gm-Message-State: AOJu0YypFPFyVzwvUoIl+hemCBaN6pY17yYS52ftzNDhH3+GGJGW6oaU
	bGvUuuYLpnD0Nf6beIdceCTPxK81Mu5tAnIPdvmrmGnn15MEEghQEDW0etgg/LqLkaOAFaz3pex
	xIlOTPTUGn755MP4bu8S3lnppkDfSg69Z9ZQuSga1EhreHuKR0BMOOD3JQAJ5YTF91Lx11GadeH
	Jj
X-Gm-Gg: AeBDieuhgJkN27lJc4lgJKOGdVzBTdmpcV/0JPcSrPMJ6YlYcT55nlKIbqoo3lAAUNb
	/t6Fr/L1FD+SE+1gltoi6bnZgcm25sw78c2qPowtxA8P8rqvZ9fU8vebW3DX+lyVvxgz77FH+Hf
	x2xDkGoC3nJcDEwDq95EACDq8HsRYnuutKqDq4QNS+Rlp42S0Z7OVl0fdbMrgFlZqYvL8Dnfy4p
	pyuBNvKIvVvbSMUSu8L1kfjLH+GGSS/F9mKyQCtoKqaPeL8xysTmUg01Hfeab7bUraZWrmZstJG
	S2czEIKL63AYp9tIsWSLTPib39As1ZdG1QG3AK/gtNFILt6e/xN0LvUA4j9SFFamrbO5zj7Kyx7
	92hl7IJM5/w0gHW3NuP6x0sdNYEMHgEs6uV6LoFebFVUtprKNps8jY1//s4xa8ur0E6XaHQ2YyJ
	bccaO41hdHQSaqVw==
X-Received: by 2002:a05:6122:3b82:b0:56f:8cf9:33c8 with SMTP id 71dfb90a1353d-5755968732emr1762270e0c.2.1778140950042;
        Thu, 07 May 2026 01:02:30 -0700 (PDT)
X-Received: by 2002:a05:6122:3b82:b0:56f:8cf9:33c8 with SMTP id 71dfb90a1353d-5755968732emr1762261e0c.2.1778140949657;
        Thu, 07 May 2026 01:02:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc8341e64b7sm51465866b.48.2026.05.07.01.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:02:28 -0700 (PDT)
Message-ID: <9afad9a8-f25f-4cc9-8af8-047fb46ae5ff@oss.qualcomm.com>
Date: Thu, 7 May 2026 10:02:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] media: iris: Skip UBWC configuration when not
 supported
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-1-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-1-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc4717 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dl9dPoTF8b8Ju4ANzBEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: gtphv6wCMNei3eSZe_WcHVdd0UmV9YkG
X-Proofpoint-GUID: gtphv6wCMNei3eSZe_WcHVdd0UmV9YkG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OCBTYWx0ZWRfX00wN+yyc75db
 RwNHna4hkno8vmNBooets/y0UJJiE484EVwMrQz5O2BaX9YzV16Bszpg8wkeEUOIJ3PRb5BQZgd
 UiLaQ7AAc/uvq0bWXC1oHLKQWg6e3TjussTyT1LX1Q5ShR9xVG69ceq4kmg5Hi8DLsDUMpum8XT
 RoLGAXEnsPyk3bC6e8pmQ9O2oRkwB5PaDiQ4I07mBY6B93SHBomRXuiAqFsW4OrXMzO4pwY9RC3
 X9VDD/jNiuUneU0sUQ7AW00ySyTDrwdAmD3EqNEYXrg0DPPkRafj+nH6VnJYzaJNVlHFm9JwFVM
 ngeQgBFwWesJM5Ux1ID4+3q4tBLdW18+oIPv6T/6oTLRCzpDQ7/npWP7tFZrAh39/tLleOTBJpE
 IFRtoqgqpXvSaYTof/2QDFqGnB/5w+j+1v2897Pq/xjZqZAqCfeHFknXh2AfTIgSt++XaRFpwbH
 oqd4tX474KWQWiqNInw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070078
X-Rspamd-Queue-Id: AB0344E4711
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106283-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 8:42 AM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> UBWC configuration is not applicable to all SoCs. Add a check to avoid
> configuring UBWC during sys init on unsupported platforms.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

