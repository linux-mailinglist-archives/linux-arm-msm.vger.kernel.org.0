Return-Path: <linux-arm-msm+bounces-101279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKbgC6zlzGnuXgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:30:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B87C6377A12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62EEF31A1911
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8962D9EF4;
	Wed,  1 Apr 2026 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClJT30o5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IA7tjlX8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B928A3D1CCD
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035284; cv=none; b=R6oUU+fzSP2Q0f+IS+H/cuPcgunOsxQzt5HN/SslHKEvDJ3DOjAebOQMzlFrsmegGTNGBjqpXwcsTXv0EhvgTQmmHnt2fho4c8K7DRFm3W6G9SjXi0GDgs5wPvdWqZ3kcf/vVqnJgQSDhD8020nPHgZ+/YG2viH8vmlUWSjzz0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035284; c=relaxed/simple;
	bh=NoCow4Z6L2G/wxb8DwrevuXxTOuceAl35jbs4vGKYa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=deZG4my90mKpBelllsa2s+I2nbCNLNgOJtYtg72E/FeNZx4wrgpQRBlM4hYHW330S/yKUPqbi9QQKrxXYkcmavQgW60ekTF65TokAtNFUOIun89WaMd2oThihd3E4cOCj5kXEw8RupEdvEEt2RtSFXv3rm4+1vwBQFsrTMM2zv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClJT30o5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IA7tjlX8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317qXpw1004241
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 09:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SBI7l9zOQxhycvPzhOFDQoTqc96GsNf9eLIJ5NTRHWs=; b=ClJT30o5TGzoJuEw
	DRHmI8SBcPR8/BKe0LQnKW2fN/A/1bu57CEvvKbjPAFK2rXAukpPNRoA7ydBongK
	SeEdzXY3RiA2chXjRkEHSjrx48QnaarcH8n8StJb1U4i4korDLdYWAS1IO080Kce
	0jhBeLBxqpq1r2FibPzFjYf4kz5O6QlLHhq2FgSdtSfT9uWoGKlAuzH7MivqDr0U
	UJQoo5OT8eXgbgo9n+w9PQiJJ8TkzflYS98Q5oY+L8D0e0PSqjBOHQ5frGYp9s4c
	F76M4EQN5NYFBp5TDaTvK3QalLfMVqgNu9DzsLdmjdUKzhXT5DHl58jr/+gStOCW
	S+l2Lg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjhj9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:21:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b9074bd42so20577841cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035281; x=1775640081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SBI7l9zOQxhycvPzhOFDQoTqc96GsNf9eLIJ5NTRHWs=;
        b=IA7tjlX8pkGfijPNMRnJrNMmbrsIcCk1l1YmQxZCPnvZatuIO76AP3FEoB/yj6xwk1
         5QWyTYIlgmKVtSYYM8GeLG/1YoWUgb254Kk8m/26CwOubaJCkSYu1w8rBOJXvLW0Qtf1
         lszsBwIkjazaXkIUFESqs8y25LnD+DMPN9BFyBCf0IfokBmuZnUU+s1TiVTn0ual2xBh
         KHQUUnAAe+d+PBN10UgqKt8oVyfETJFeps0dy/xiKVm/gOAr6HIw7S8BEzpLl9NYS48x
         fBULeBEvOlEJZ9W+zEGqIG5NLRQfy6z8Q2alwL0DoSj5THJarzGgXRXn2i0Kl1eQhNen
         8omQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035281; x=1775640081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBI7l9zOQxhycvPzhOFDQoTqc96GsNf9eLIJ5NTRHWs=;
        b=Bd73Eh1MCVzm8QmXILydw0R1OVzSz/78EfOrySQBKAGjvfThMaa4KMF6uOE5S0167d
         tbsg0q7mO2DZ+1D3uBGQNHd9zUfg8+Dk0/G2tbx6k58DKpunkEGQJqC11ZHqSBlXOt7I
         KZd5A8PDUkXts6/OOcfxHuXQJPG0JNsdZI745pPPdNgl2INGLzkdCqQX19BAHQwm1n7B
         oL9WtC+eRwMtaGWaMmat7bckvlXqOr1xkr602E+7jkt2ZkzwqdmrObB8F4ItuC7yduxJ
         +1JYsLwoLe3ZD6PXnjdryM99v1YFw9EMBWow3CsH1G6asEadcEs5VhVg7RaoWMnPg42s
         yCnw==
X-Forwarded-Encrypted: i=1; AJvYcCUgSHx/nrG4OY/GGmVquJee2Z7+rq0ODQkobqH/o6kN82lPiDCDRBt3sDlx/eObmX+ntTczx488MecpVeY7@vger.kernel.org
X-Gm-Message-State: AOJu0YxnaiMrGM90QeIL65TkNEjz88OubLAN8mF7DjkaG2kLcmK7s+YF
	ei9dV9RuM85lJRlgzglE7Osg1p++zf79f8t/cKZztiKb+45b+uHivyXdbNqVVgM/Ic38pGvDAvr
	dSpcHRTC1EvmDOVraqjLfF50TJzpqSD2PHZAZa4+W+OyUZ3RjYcuRVq13p+WLBMldEUup
X-Gm-Gg: ATEYQzxUFNVmQ/YxBh/xj6pd7ycmHQmtmdLoP7QawZ6A+HJWrSNtfO4AZRcU66h3STj
	TmcELQU673ac5+Kq6X/WJuuA4VlAeMosYld5sSoKhIVpbC46nfl8SmptbDJj72TTQN0Y0QcL1ZN
	CXwQ62xzSTmqcO7ErWF6lDDZY1z7Kil0Xrz6ZtXP10gPjve6nWtEO31MrpUJxL/ZNSHSVmaOpW5
	gIK31i6gJ2mazEv1GCvORySr/cpigN3oC3vWDeM5txUngvV84JS4NZShPsdkFTXLmLQr2+dE3Wm
	mOYCNwQe7GV/prDqVd0TB99vqEqAnOaz8YnCrZ3imVbpPCoKDxL4YSLP/QcEzptoAt40aLjcWA/
	ENHKn3To87yl49ZqX+zaTcMC3086YftPIS/tgyyJRPtAuH6FjA54JNyC8eRSVDpeyz0E8G8NMo7
	qFYNw=
X-Received: by 2002:a05:622a:98a:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50d3bccc4f5mr28589091cf.3.1775035280853;
        Wed, 01 Apr 2026 02:21:20 -0700 (PDT)
X-Received: by 2002:a05:622a:98a:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50d3bccc4f5mr28588951cf.3.1775035280472;
        Wed, 01 Apr 2026 02:21:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b227393sm498818666b.63.2026.04.01.02.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:21:19 -0700 (PDT)
Message-ID: <29c8b202-2d99-4cf6-b523-0363335b25e7@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:21:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add power domains for Hawi
 SoC
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
 <20260401-haw-rpmhpd-v1-3-c830c79ed8f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-haw-rpmhpd-v1-3-c830c79ed8f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3wXsNo8nXb8u1hDTlAnpGiTtKmMPYWYs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MiBTYWx0ZWRfXwIuzgSe/hy0h
 H6PTULJCJdazF/vwQ0/9w/098m5hShgbBYrf9orUSqS99VXX6OQy5qpfdlNympX0R0XoyD+kOx1
 MBS0RdW2YmZN/dJbiqTzD/EuUrTfO+TQWJfnLBmnH5XaJqJL9zXz3yznqOyMRsEejoWqsN1dQ0B
 SP9VuO+9/woE+DTvqqNRDNgmzTyUJd+X9Vv7aryW59k6H17LMBI4O6tFPQyL1djEusNu1v8c+MV
 99XI9Q5Q3GNOEvsvchrTk0eLJY59zV4UpKakEEQoTAC9Om4RSO7NImz23E9TWOARmB2dk3/evGA
 12gLE2DjoYmmhNrmkduxOYzgigJUVHgzoruyYGjQFLlv/IkueQQMhJO1TT/6snEzA+AX9eoAYsl
 haAIy14mp3MyY20MTbAnV1PvlxC55eSrfI7acsPOBvIftMyaFyz2ohFxY4hdAEj5hC3i7eQ60WK
 0YG2Dbz8qyC2pmsdSgQ==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69cce391 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qZ5ZlOtsQYTu7SIoqgkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3wXsNo8nXb8u1hDTlAnpGiTtKmMPYWYs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-101279-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B87C6377A12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 11:15 AM, Fenglin Wu wrote:
> Add the RPMh power domains required for the Hawi SoC. This includes
> new definitions for domains supplying specific hardware components:
> - DCX: supplies VDD_DISP
> - GBX: supplies VDD_GFX_BX
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

