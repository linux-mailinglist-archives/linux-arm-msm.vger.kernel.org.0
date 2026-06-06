Return-Path: <linux-arm-msm+bounces-111542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yAxsEvuvJGqJ+QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 01:40:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E156D64E848
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 01:40:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AMEh7HsG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eMK2IwYm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111542-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111542-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 654CA301BCF1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 23:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7074071E4;
	Sat,  6 Jun 2026 23:40:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3204A171B1
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 23:40:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780789237; cv=none; b=WusC3wvfjf7LdP+E3kDN8msz3I2B4ljim6p5gjUey0uz/IjspT88lhREOzFjZaBpc9hhwWouERgIkrwPeY1rWb4Spuu3grJ39iTAsfW3VdlY7FbL24E93Wj2ofr7v9mHsK+a0VIVAuhVO+mA9ZgOfKffA6zM09Md/ndsVw+24MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780789237; c=relaxed/simple;
	bh=0tSg0qtetG65h43kizYT5Ef15BXihynhKBAYPep/I8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAPrcSI0LaBW6XIqcw18ACIG7UZ23BYaM+79cSrVsSaNYa0PpintBPRAFy1LMT/v19G1hQEkTdU5eNrdS/KMvzEC5YOkT7814l7eWXdQWn+h1P8j7uDIZRfe/wGXiwIRy/XG5dQeZlTOzLgA5kuOFUP/3NcGm7iHWOCDvONp+0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMEh7HsG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eMK2IwYm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656Mkv3W3113403
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 23:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ytQEAZVz7Da6jMOM9zHAfTS7
	wz3IgU/VofxpTcuRh/0=; b=AMEh7HsGAgeKLmsrVlGxmY4DyYVgqaXUHeDa8f12
	XKJhiq/GdpvsXqkRKB1/daVMA2BqYazj3xYMdguk3H0PzUSmfNWL1rhm+YJNVU6J
	7lpdhh1WHlEfu38MH060/ITIR4pd9yz9vcisAO/7OapWwJNo/Ufwq+ROEBhUfkFW
	VMOlAyaYEOxG5lz7HvEr7yarm8uYJeVtcrR25WCXj0n0CuQgE42MdQzT2zTOkPPb
	8einbOFjpYqPNghqvNC4DDvWfar9FaZVGLKXQ4xG2AstvI/Jkg16GAw3DbroOgvX
	aJFbD8vc0lO+JZk5A2DJt5EO2uB0SrvbDwNQdGU+Fo+wOA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3jup5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 23:40:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c67361f5easo5523977137.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 16:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780789234; x=1781394034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ytQEAZVz7Da6jMOM9zHAfTS7wz3IgU/VofxpTcuRh/0=;
        b=eMK2IwYmPm9Tme/GBXguMiFimvaileQjf2WQx6h5NPGQhUqKNDJG5WGHbF7ojXQekX
         MsV6kxtZuis+yRgmhDbQnf5v+QzOkMpZbx1/aXxIxJfITQT67Qm6uhXZ7xEp+yY09/Gs
         ru2LVIhnedC8/8NEjav8X3C2n7X0DIuPk026Lpijcrz2T8+/ZBUyJFyrdOJtVy8G1vCT
         UelJh8xcnV691SpUrdFDQ4vIaB3SF6Y71fWT29ZRN3f3pxj78t2BPwxnf2w8YlmNBFbs
         eMGeK/qHu0w7NdYDdsz6ho9N4vJDcMTsBtuw26ElcqIyHgaKYJd3yyxx+6KqHfr6q42X
         S2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780789234; x=1781394034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytQEAZVz7Da6jMOM9zHAfTS7wz3IgU/VofxpTcuRh/0=;
        b=GbrCxsAcE39t9a6A5tHJPHOv4K4rz+lJ8N0nEsotEgP4PtKYYYmMgbPpIsEnMcZh1b
         cxTVM1VQNz07KVMlhKgoLNxotxhEQ+Zv2aGAFRc4Z/kDHCfHEBObayVvT4O9BY0Y5HtA
         E8VxJ+Yv1edt/j1BJkoWlBoVqD+K8vb21mlWa8oS/JA77jD793nqU/LOW3MiH8Med3j3
         fIeqVwuwOaoqo9K8fOJHRjvBr6Z6n8JjNC9a+r6CM+PZEWHeZwaAjeep+4RwDe/n4hXP
         tffkP48gJOz/z57IBsXRvMttR6zxJ3OlZ7Z4d05DGaLvDgQTNeYt9E4GwEA+Ijj3aayY
         fA6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+YEyky1zsLVDbk8fbujxFMTn8eQbX8OcTYp1gydcPzj6bjISk8Z2Wtk1JR2n1N+g/eFAeyYtwWGUJMS6BH@vger.kernel.org
X-Gm-Message-State: AOJu0YxUKw6k6DUNDB0BihiJsTwvmFpRTRvlAStoDGZG8MEY24xQ8t4H
	4ieu4DwOdW7VzvOIGcnT0FC/ExwvlD1zfvRspx1SXYyjNcf6Sd/9e9gyoGHSTh7OvqQdd7lZCUj
	i7/0qAOpS5ewc7YndIdTxJIgGDoI6xyMieYULKa9PS9uc9TMV6kbI5WZrZ135vd/lrI/S
X-Gm-Gg: Acq92OH0fPwwXY2H06hveWKjcRniM+EJ86TwmxrVU/8dNBT0vV0/qetHxbnnP7T71Jh
	rIumnlTQ07EpAMB+eDk50fwqusifl0r2SRK60ZjQ9UsrNUWToM20nN1OtHipkMFXgAjMEZi0+dz
	MYInLvGokcEQIVfD4lZP2onKseocwA3I3e0oeXtqBibCIfiiUTSR+iupWIfvzce+UEFuPRs5da7
	1K4XCaFmlxb9lBS4orq4zfvsxamMxKWFDDEvPobMcHjqgDWO9RUCmiZVxcFsH+oRLpZwPpnfKzz
	a9bu/bCA1qmpFJJ3YL1NLV9WL4uikp9C+1gHseaiEsY9UySZ6nMHKkwN/V9kDiMuZmOcoBYecE1
	30lydF5rNtrf8MqItPBFkhsx1eMqZms4DqngJww/MrDDT2uhqMv8c4M7X31tLQKAnHxf8do6cwM
	tBsH8pP0lybU2aGZiIGgjVNFtDIMZlrtOhPbu9N29IPHIdVg==
X-Received: by 2002:a67:eb47:0:b0:6cc:8a90:9f88 with SMTP id ada2fe7eead31-70037cb32b6mr2469829137.16.1780789234353;
        Sat, 06 Jun 2026 16:40:34 -0700 (PDT)
X-Received: by 2002:a67:eb47:0:b0:6cc:8a90:9f88 with SMTP id ada2fe7eead31-70037cb32b6mr2469816137.16.1780789233950;
        Sat, 06 Jun 2026 16:40:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b98fddasm2695147e87.64.2026.06.06.16.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 16:40:31 -0700 (PDT)
Date: Sun, 7 Jun 2026 02:40:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        rosh@debian.org
Subject: Re: [PATCH 2/5] ASoC: dt-bindings: qcom,sm8250: Add QCS6490 RubikPi3
 sound card
Message-ID: <6svyrusik3lljjvoo7c27b6agr6ipivjxzeyyo6z5va2qaiatg@g4l3vcrns6hj>
References: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
 <20260607-rubikpi-next-20260605-v1-2-7f334e16fea6@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-rubikpi-next-20260605-v1-2-7f334e16fea6@thundersoft.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDI0MyBTYWx0ZWRfXzVtfZUObBovM
 vhhPx5vsVoXKFdZsYM38Ldi/7SqoVHo3B5cQlKNQc41Mojtv2mwOcK0zbgY9LHMDRu3jXACQDhm
 sPwDmU1w57GJbz1yvlmAD0Uc/bunMyJhdM11bZpIxVpHRZnUvmhaV+Xb1rRdLdm5CB8zeEEUI7Y
 lr9Ay00kDsu5eGCNeEXs2QvKu1mLjl/AvxX0Zh7u2IHSsp03727rrdifm24ppxF5+IRLxlCDHti
 UvC67EelCg5FRYSD7V25cNCjf5BqjTH18KDzYkOs0HNpntzSok2QLqJv97umgLevN6vNuMFjS6z
 dj64VjEPI10mXnvJH53At4y+ym+ZeDaNC4vd1hNoI2+BIt6sWO64ziBIJ/k/IpvMJO/0WPPKPHr
 R+nyeb6/4qxVio6ygciwqNF7gHzdr5Q3P/pVyYBZNcvLcyKMZPHdBJARvqfj16lkFZ1fd/aLThy
 Z6VVgOaJstpTkl4Bqxw==
X-Proofpoint-ORIG-GUID: qp0sKIZhB8JtAdf5bWW2NfjY4EMF-b7p
X-Proofpoint-GUID: qp0sKIZhB8JtAdf5bWW2NfjY4EMF-b7p
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a24aff2 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Wdb1h0LgAAAA:8
 a=rWzc97tzM5M_N3PrT8UA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060243
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111542-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hongyang.zhao@thundersoft.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:drake@endlessm.com,m:katsuhiro@katsuster.net,m:matteomartelli3@gmail.com,m:zhoubinbin@loongson.cn,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:rosh@debian.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,endlessm.com,katsuster.net,loongson.cn,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com,debian.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,thundersoft.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E156D64E848

On Sun, Jun 07, 2026 at 02:58:18AM +0800, Hongyang Zhao wrote:
> Add the thundercomm,qcs6490-rubikpi3-sndcard compatible for the QCS6490
> Thundercomm RubikPi3 sound card.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 15f38622b98b..d95e072fab25 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -48,6 +48,7 @@ properties:
>            - qcom,sm8250-sndcard
>            - qcom,sm8450-sndcard
>            - qcom,x1e80100-sndcard
> +          - thundercomm,qcs6490-rubikpi3-sndcard

Would it be better to follow the newer pattern and define one compat for
all Kodiak platforms? Or would it be possible to use any other QCM6490 /
QCS6490 card as a compat fallback?

>  
>    audio-routing:
>      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

