Return-Path: <linux-arm-msm+bounces-93139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Op8J2ZWlGnxCwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:52:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C75A714B970
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A8BB3006996
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807D733557B;
	Tue, 17 Feb 2026 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZimxVwtm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SdINO7Mr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFD3335566
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329103; cv=none; b=MS86Zsa7Jw8fXupfRtC6pHUXpJhs1dAZ8M0A1MxpzK/vHFJcOYhoBCvUV8ilaETfgah1wySLP1hzaJQ2zLYkJuNRM1cFcSe2TnBwVCQlywOxfXWsgC9ztCnku/DEuVnbUbqNJI8YKy3N4tVEVj2kHojlYLHUm77JwoFDtb5Sy34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329103; c=relaxed/simple;
	bh=fTr5O3C3gyG1GEXD5hRz2rzuUHmMOHtghcbKPoae4ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gd7podwsCjrfn7ldn5kHYplylrP2lBWA2pnvh+uyc/41cDvhGP6lq/3V30lwKAldvxi56iotAXkhuXS3GrJ85PNDbnQUCXVg7AYFCwMpc2l1rWYR1PCT3An0jziXEUaNguc/tJAT3Rak3FVMJB6vlQ1SiqFDKk90oR6ZJQWTqoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZimxVwtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SdINO7Mr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9Csfl985203
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RkeoEigFEkq61Hzx1HfUblX/
	RJEa8RLEq/5l5Q8F6ls=; b=ZimxVwtmV0Sj7ARYGVucYVrRXO+xo76ekptgrrWb
	q86uqKyPBPxRwE4Jwdf5j3eav+G1kFKbEwrq8d7jxHDtTSIV72I9CcUYuvcPMQ8e
	4z64NCAZxFZ+ttznkuJ5XlQ76tYA8T6kj5vC2J2NkngKwl49PTZMtoPVRHlwucpQ
	8SRNpCnXXlH0C5fC1aFJDVo0tlibcBUJkBnKwYNiWij9c+KAGtouuUP7Xyr6olmv
	Y9BWd14cXjoFXsj2I6HaMR4V+kWrjiA1QzeuKn+7OVt4wclyYfKRESJphclf+coq
	deDDdPtp5tqsnpDn4Tp+ZYN6QXTt1cNg/OX3XsYGdqL8nQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap2302-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:51:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb37db8b79so4723608085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 03:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329100; x=1771933900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RkeoEigFEkq61Hzx1HfUblX/RJEa8RLEq/5l5Q8F6ls=;
        b=SdINO7MrDB9DJ9l/PO9KDRDRNT3bHSlTeENLJ/6OTVS3ZnOWQcszuXkA3G/Rb1ZlXX
         bcSUQxMqb/k2zbMNZriBgFbRlrSOtmUW6U/YncF8Ej49YCaHlgH1N+ZvAzIJ0Yl5ut0/
         4vdvIdJR54bd5FhOLJVT/pimWslr3urqtxDEinT+pMIkR0duwgkxMjHzOTysSOWHTI3r
         fwseS5PZFL/YLmFzeRbumh0JcFSZ7gPSrigTC8y+dIcOZn5QT3KVWkvDkeN0jC+kSeH8
         OnPGHTi1VwfeEZQ16QFjyR9xjxxkvXIbSzDYenO9rN4DiS0/e973y/XX+K8Nddqv7LqY
         qgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329100; x=1771933900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkeoEigFEkq61Hzx1HfUblX/RJEa8RLEq/5l5Q8F6ls=;
        b=gHOcebLYxQl7FsvbcXQcFBr8GuiOHg8vJF2qnspQC5IdqOL/1HHyEJHVsE7s9lUmv2
         oEZ0GtJB0Go9IwUF11LQdmhmTABco/cQsydvskPrYBce/PPR6/9hBQctHtvsDBZ0IgfA
         poL+NW1O+Ak1vUTV/GB5bPm6zlFH17nf/mEdL/SSOx6KpAIxYmE/UiG4XUX9++YfNquC
         zrurslDhco0dd8zD2BlpsV2KC7buZyGA864bVgAyD/6SVOcgy/pXasKpFz7OEVOKHQE5
         lRNR/q68kY54ZwN31A8zLO3YY38DgwwljP/CxrXSlLvVIKxHvncS7wv7YKOFrOxbSYXt
         9qKA==
X-Forwarded-Encrypted: i=1; AJvYcCXCDq4XJshzdgtq7LA1nbkEJ7k1t9rcpG2G7I+UqaHy5q6tulIwtN2vJxxfyZBiDdplUuKP9c3KnnA4Pomo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Wnybjxa/IR+0qgNpjcB5v6jGTnvoldCn0r1fXDCgBqfg36L+
	RXWQ9BTZj59gDWVO4DAC73q3MfY1/fiutq2pM9VwUcYdkfyLmqp8ZueFNmUkO5NyEyz3jZH9dQl
	Q0C7h8jQ6453f26orFLNcLx2qELOWwk+QILwpFdf2NXNHeDglcoZm27pC90vdcAVLQqQ2
X-Gm-Gg: AZuq6aIHE51ulgpeIiqTxV+EI5my+vk4eeELyI6+OVKwYuj18eQoVF5fMbbgy6n9Yo7
	ed8O/vzVP5YPj6/+dMIR9ao27iIEF9+hvIyMiL+9w5DHhcCMHKhTSRu6TTtjHPbtBtigIwX7sgp
	gbZRgsxMzLNjtwkxR/FXy7cnN04Fo5Y3TFqOW7y+9jUGAyyYfMPwLRf6vLcyOxi6vopVR87EWMx
	XOqBTxL3XL4OF8LQnV1quYCrjtQ+5qtJBXuop419xrgnncWZ/IQMAeC3ORf6wMSBTVADdv3nEQX
	ToidZgWyNz216lNHMb9RUBOBnjpeGJ0i7GTXtpgckIFp2qaV6QTVWsQN19Li5CxRqaQzem9QaXz
	gbQTX+Xi3qpqa93SDbbvIyImWKiVJh2L8zXnh
X-Received: by 2002:a05:620a:3944:b0:8b2:f269:f899 with SMTP id af79cd13be357-8cb4bff2a01mr1339159885a.56.1771329100538;
        Tue, 17 Feb 2026 03:51:40 -0800 (PST)
X-Received: by 2002:a05:620a:3944:b0:8b2:f269:f899 with SMTP id af79cd13be357-8cb4bff2a01mr1339157685a.56.1771329100065;
        Tue, 17 Feb 2026 03:51:40 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a3f835sm104875305e9.25.2026.02.17.03.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:51:39 -0800 (PST)
Date: Tue, 17 Feb 2026 13:51:37 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 4/8] pinctrl: qcom: sm8750: Expose reference clocks
Message-ID: <h42urqeyp3njwuekzer3zag5nv56z3tdvckssd7tepsr76ozwk@2uwt7yqamkmj>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-4-cd7e6648c64f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-topic-8750_tcsr-v1-4-cd7e6648c64f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OCBTYWx0ZWRfXzP/WF1bjB3xu
 G7uVxu+C7lk4/aOXQzSzSnMosUZLMTqWwANYJmhBwIaQD3SJwq8xsj7jm+ONWAh0vELooy2wbcs
 vA3twHVZEfUumhh+Bn7cFZghe/b9mLGu3AobCVLeAUBE5Z9k48Eg4cth7Bmyerq+sPXX1qOBZqu
 Fa5rMMbcEiHLGQ/sPID/1oDeZsFsqTzsNYHDjadtm0tFfkoPJWvqA7pjagN1bsvfON84ehFGjBa
 HbG+Lm5Zqh4TeViRUIe01IcwPeV+UnTQ92QLowx+jzRt55nyyFs9mg94rx9qt6ZfHvZ9mkrWNWr
 0WDjnNHQ8nr2GBQxTlmNGaUilsX4R7ylNMiF94p4HmUIKSNgbBpVOS0E49EgLC9hccrXom1MA5m
 Q2OKfVvZsBQuknXVo5CWSDqZoNv8B7egI//U6cqyRrvAkIJ63U1mP8rZNfkx3ClXa9OSa29PjPh
 0Ae6fzqsqfZXeADtHcQ==
X-Proofpoint-ORIG-GUID: SzGGIVZ39VrZVqO-3dR1utca8S-8kZ46
X-Proofpoint-GUID: SzGGIVZ39VrZVqO-3dR1utca8S-8kZ46
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=6994564d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=kBfrMkYwO43iJOCXJAkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93139-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C75A714B970
X-Rspamd-Action: no action

On 26-02-02 15:57:36, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The gating toggles were moved to the TLMM register space on this
> platform. They lived inside TCSR a generation prior and are back there
> again a generation after.
> 
> Expose them, so that they can be consumed by other blocks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

