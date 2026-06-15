Return-Path: <linux-arm-msm+bounces-113168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5D+OExLtL2qcJAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:16:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8752E686149
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:16:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jbOq5iTV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FlhGUq78;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113168-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113168-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF57C3050461
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F216037DE90;
	Mon, 15 Jun 2026 12:11:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8654D3E5A04
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:11:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525464; cv=none; b=HEVDpdanS4DWHIYQprHKySVz4ChZ0UibtQV+5sd+FGT140A8nUj4K/O3PbTzRCte7gYJ/VmaNPn26WMd6SlTsblIdbk+ZQiJwUejIQzbW5spsu6Yg+NKMbY00uasC7VVvxh4a5yJdPrFrvFgdcSD7kQcTW11JOn1h3SgcwrVrXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525464; c=relaxed/simple;
	bh=SYS6DuxvOsAPUHg0CRU/asuNx+GYt1ac6BM2JbjTeFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFWmjvRc1SD6zML+MCakaIIdjCV7n/MfIscfV+QLR8iDkDPot8Q7bpod2WasStUdLm3tIH3PAh8vdb5QgrIcsAJFJ9rj2GUZT7xTbuvB9nCJ3n/weWYQTZWheGizUnLG9yOxoKyPd5nbSOgfCBRpTE0+v7QzhpnnISExksD7iF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbOq5iTV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FlhGUq78; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAqv90362737
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+QzD9QjCDgi8m96sISja9Y9G8pf1CyaetmofKENz/yg=; b=jbOq5iTViqae5GaE
	VrWWF275K6FaLgxT0cPSG6lIHscXn36i8CaLzCmAlkF81wUunDEWs8Xq3S80JWCQ
	5x6EXRZJdB4tws19ZVqL/3CRvQ8+zlEpEmHO4hz9V/e3uXplNRGUlFwygqEdw5Zy
	XOUWA5uivmKNSaYFN3D0wKOlOMwQFQUJ6Uszxk7ZKsIseojf+GZ3cTybS35wTFLt
	poDLklPkFgNN6j4iewh7pup70CUPrq0kgg0qGH8dwjG13qtfzziKEau5VC52nZM8
	3zFAyFlhcm9/PwVh6oeocS1oQIU6jYOEc6MzqKhUQyJ84VWXklJJO4Po9zcG6bMc
	DIV/WQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2c92d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:11:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5175bf22b2bso4039091cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781525462; x=1782130262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QzD9QjCDgi8m96sISja9Y9G8pf1CyaetmofKENz/yg=;
        b=FlhGUq78Zu57tKx1EOIl+4Rp3a8yeuzL4r+JzQwAkzwPtJYh8pGxuxiSZaH1HyaBbC
         UeXrnuvezEPwkPYVaWJX5vpQX+VJRxXW/J+KZR267D7YdUdtwNo8a54GW4cOJMRrX6qP
         oSBcNkhJAad37CqRUrhvVdJBl9d4owgqSWQ63ew4sfII4abaef+nquCqsTNwaRtxPjx5
         aTT5R+2yN90H4VMYybHyY3880ZzBNFuNXZuv6qqaaENst2Y0oTlOx3FR5L/W2sNiQt3D
         ukZmZi1mnboptE6mwhbA8k2lrD2cyD4SbKEiu6CpsYm6ozYvUNblLg10r+PYdsv2iUvS
         7YFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525462; x=1782130262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QzD9QjCDgi8m96sISja9Y9G8pf1CyaetmofKENz/yg=;
        b=FduAKS8O5qGUJ+QJBT06cjHpe3VlUBMZNyKbsTHpdbiKlorGwIjE7JFqGgCjf4iwjw
         rJkgrrOR/5VUbd43bTsuRfabYXOVwee0WVhmzD0SwEuRQv6WJEnwzaxWuMWauQgrB0OM
         17WTvR9vHHaaiHT5Xj+YEKrU7PqJycG3WTUw2wz7H1Z9dAMgvvkdwJwW2pPg939JyyCA
         DwuYCSTtkvs8m2pawILjop7rnaevy/Gsa069rztwRF6kNU3iipsACaOtl8d2DDchm/2R
         cGDmdOWW0/nytOdbpl7NUF8tB88UxqQ2LGQVFxYnIhdhpgpgX5Hh3TswFFweR1YchI2/
         bF6g==
X-Forwarded-Encrypted: i=1; AFNElJ9xb9kc+WNhJiKh8epi1P5wW8VAGbJ560Nl39N+CsBJ39uFRyxWgLZQCJ6wgtAKbB4B8n2P3WPBzgqra39V@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3X1PoVDDqzMRF9yiV5hpKENqYeoXfWBUj6ui8FoZFHpUI9dQ5
	9Mo37i3QjOeho4dI7++0TrOueW5/lkmOM043r6ND51a8oz8QYs18SgPmSQmwK7Ow4qcF/O6lhuq
	kvpD3JIWmoujx/J03SbIxIYEetG/qGIkbb1BmH2JrXsZcc1BLEXPYaoeckQPmuUtaRUD9
X-Gm-Gg: Acq92OFaMbkBLWxwwPHuOxcterMEL5cm6FMmtgoTODsIYs/ffC3UM5XMpNRUVyn7zO6
	1z6CUSBH67VjowXpiHBjicDDWdVwC4xBC3JWa8OCS+lYDlfqd57QxASLgVUkNc+L74XLl4pgDDp
	gaF87TMa5qe2l+UAp6Ay/BxXg7jF9OM/A2GHhKmhcA86RYzZdtmdF9RFycqR7Ebbj52riBI+NjV
	rBuo4MkKCKZkSu8EYnzgBezd0HTnYTn2ThhePN4UXTGSJZzudx+Z97heROIHwpdO0qItCYykFBc
	rcuhA55aF268TH4jroyjw8LfUl8BoyYlWL5nruzgex8DJiE6V6e8fkXaiKxkoTuxbY6b59CEeNa
	W2VqLTuCx6eKS63rSNsoi/5ufE2b+e1RdXaRbZMOSKDp7jg==
X-Received: by 2002:a05:622a:1b01:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-517fe568e67mr124102761cf.5.1781525461696;
        Mon, 15 Jun 2026 05:11:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1b01:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-517fe568e67mr124102341cf.5.1781525461225;
        Mon, 15 Jun 2026 05:11:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb9013575sm464826866b.59.2026.06.15.05.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:11:00 -0700 (PDT)
Message-ID: <2f76cb76-9bd8-4f95-b168-1250de12eec0@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:10:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: kodiak: Add camera mclk pinctrl
 definitions
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <20260612-kodiak-cam-mclk-v1-2-fd294ff003a2@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260612-kodiak-cam-mclk-v1-2-fd294ff003a2@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfX7uaBEZpKhBOP
 qBLj8B8Kx4QMSJC0Y8f4oaEILKLSu8Y+7ORp0HOVab8ApHkIa6LHqzYCRCDFAuBzwbgqmBvf1PC
 5I10SH17P5TFcWwsyyc1G5BwJr/rBhxZz1U1eLDE/09zDWLwLAm6E0CUhFxSAukeEXny3tXsPvr
 kSZ9evW9vIIh2orM46AdLBwzQFc5SdfECWm5rrj9bJU3PFWO+B6tfy59bq4+nCAwhmp3QRki3ec
 yVsVgX2HxMw1jAO5LFtZiU7mgEITL6kJlNz1v435v6aGpJkZTqOCo88lEt5Rc/KeLKgFmIGgDBx
 OrRdFxf0POSbhjgZ94Ds3BX9uQQkM7bq02RuV+hgX1ZTr7uKCK7R453ieZCW83+vDKetzdolRwv
 SLWAB00EYsOYGBpArHDVn2dWkbn9hbzIt7Kl++y3EmFlaRz9R4Xp7YKtvkUK+Otl77BgG0CgI4u
 +vIg9dz9yQMHXyJoCbA==
X-Proofpoint-ORIG-GUID: w2fyM1IqRxMcthO3HBqCLdknEKoUI1GL
X-Proofpoint-GUID: w2fyM1IqRxMcthO3HBqCLdknEKoUI1GL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfX3louIILvT4cr
 7Hm5mVaGFCvA77oEPWYvWEG9pDjqbEjUzQ+LMrHrTUt3DKbdxRGvYF650BZc6IdB2IQzBo2e0ql
 OzSal3T6PIrLdVqkQrw+i3XtKn9dfhg=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a2febd6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=GC7ltwg7MdDjMvrKfcoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113168-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,fairphone.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8752E686149

On 6/12/26 12:55 PM, Luca Weiss wrote:
> On different boards the cameras are connected to different pins with the
> cam_mclk function. Add the definitions so that mclk0-5 are covered.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Could you tack on a patch qcs6490-rb3gen2-vision-mezzanine.dtso
to use this common define?

Konrad


