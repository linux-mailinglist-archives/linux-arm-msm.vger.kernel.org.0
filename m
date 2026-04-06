Return-Path: <linux-arm-msm+bounces-101939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEXNJ9eD02m9igcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 11:58:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ADE3A2B65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 11:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7565130138A2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 09:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729173264E7;
	Mon,  6 Apr 2026 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blXbdB0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+TqpdZw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336CF31D759
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775469519; cv=none; b=S5KV8fxs/0hCzixGh+gjawbACgRIbuS4MH51j6Aw7vA80dOljomY3zMu5+lk1CXTG8hl3shEHwCocuT5f5xpc3JLF9j6/mrgi2wIP+DCwYvUycjwW3DUHqLVosz4VhfvqPH9AVPezKI0We6Cx94lsKFFOscwqoWbvqdiVgCYh90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775469519; c=relaxed/simple;
	bh=qjB9Efsy6IkWbCFnSQg0/51oe8oCnJbjksHKC2fHSts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GofEuNFqQC08Il2Qn/rhRS4P0S71tXXnLbjdMEhjA1dDb3QOy0xjvBiiVEBNnqBaB45SLvF2CFJGCQHgJ6K+LsEmn8dqI5BgExJ4DnUBYK9Zrv4ZmsZas/5IzUHHs4edFs1qKRDokzCmJKu73CoyPlTU8IB5XdvHsqC+FZUOetY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blXbdB0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+TqpdZw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6366oJ6F4094879
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 09:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcAROAuOTYgA2N9J4X80A91Gy2H4zB/Gk4RTQ7wpJpA=; b=blXbdB0RP3GAG0aN
	bnA5paiQchAlxCR4B5kHKuaCb8AliqOFmUKY0HPVG8lc1nXLTTOgm0pABxBAh4at
	Nh6ardb76jZ1MlAjlSjiVnEEThj8xOWMP6ZrIN8/mIQ21D17P6+MhVL0dMUWXiZi
	xdQC+TODpGZwL5srnxxbIetssgGAldxbHT0UsWzbCh1Kh3PxGJH0/FOdadkqB1dh
	JP9a/fK2H6Qu4G9ieNmJ09C0JvJo8PdTdWGDsXWg29Sw+hJN6mdsQz7slEuEVB+7
	lWOSLLb2EI6r/j8kQ45RIil/cTErvtuvsvC1eABUpVFewA1jYZmmvH/FZmKBf1Yb
	Y/YOkQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfmrv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 09:58:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so2479885a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 02:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775469516; x=1776074316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcAROAuOTYgA2N9J4X80A91Gy2H4zB/Gk4RTQ7wpJpA=;
        b=Q+TqpdZwBALvng43x4P/PnHaVPVegkCBHrqz5eniKvA4jTR8yDp+lcsuhM0HHbOYGy
         CF7zxMvhYBQPdm8IYZJehZ5HqTu/z/aQcYWDIlSfXvPtbdEH+ZdN8r1GzU5SDCT/VrPx
         SePuXdGxwIkqgMl/PPYlO1rs07wPDeXTd3lxVIjalIDqGModhCnSj9711nIAVkePQfUu
         y/fQtVoXx4CW8HEfpK/WNTrYJC5W4DxuRd+VzOwY6WbsllZUEzQz6xYOTErhmamq/gGD
         eS89FDZ3Gm67Kp44tBKrjtQ2S7A0/kchBfJnY0FPRXXNUC/sYObKscJ69jvVvCAeslM5
         8m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775469516; x=1776074316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcAROAuOTYgA2N9J4X80A91Gy2H4zB/Gk4RTQ7wpJpA=;
        b=Lr9whMuLTTCye5UPCKD/WcZZLfD8C1tLMTbUdSyT3aKU5TdTKcUyc3fc3LxVa8A0oR
         r3olttOpdgKoEojMRuuGCZQGDfhtL7cCGuDyMbQBOvD8q7FhzeXCQt0BdX7viZT+OwOX
         emBfUm5n005oeLsKUwRNauhDi+dQdq/5OqYKsSclCtO0BJSyWcP317pPWbspSuZ67np7
         57UkQPHfQwR+qje1tR97d/INWO2V53YdkcE//ptVYk6iYuSaUJ3bgG4M4kwdM3YDnu9M
         fuG/ao75ct+ER+PnhUBMIb+D3/eQeR+5Am/qBGKBG2Vu5iBgcFPFHPfZ/wwAC9I8HHWu
         iUFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO7604WNNOb2Ort7cp71asOifEfNJx6Yy0FatbsV8VoGisyAB4I0hQeNz/PFeVfmLR3ZTCKjKjaMTjjAQ4@vger.kernel.org
X-Gm-Message-State: AOJu0YzF0n04L3arbdok3ej5lZma89bWcTHrByfSU93zw/PYITAAtwYl
	a04KOJNnmLruLjqr7sueRlxaAJcbJbIkgQGZABiazroNYbNou8e9w8Rk8Wf/zGeK550u6l6gtcv
	iI0gIhl2USZFqRJ5TSRwbxnDauhn2qCHHAFXh3oaDcd1YDr1Kbu9k3oPrgTQoFZ4hZt6B
X-Gm-Gg: AeBDieuo4RyrPeqxEWWATLbPYDOL8HLrSw8WEmrw/saTWTJ/S41W60oaujGMia3id0f
	i5RGFP9B4u0A/KQ8pQPqZ5O2vMGSrpSNvyUz2oXPEDxvrZf1l6eoH2AqFXhQII7qHbZhpyyUcLI
	w8tWqMuBFwfGgYmIfBuUMyKwSV37Q1wvS7nux2LKMdE7mMrSwNBRn5ARuxgycm5VUqYQJryAkjm
	qv9/AbLKXG2MuJkwUDLT+ueqs5DIoE1jvk/7hQ5QpWT3Do4FE0bJRVfwWyVxqCniQ6fa/DXEEJ+
	btGZ52kXBN+iuk7oO/JyN3nXEUmjhKKC3rF4JWcoA0V/ABRw+JBDSzuzI7EcJVtLYOyERBCqMm8
	RluDosOOTA4D8btt6zX514C0wUXhmcKYmZC7blTNBvxzzBQ==
X-Received: by 2002:a05:6a00:2e1e:b0:82a:5ef0:20fb with SMTP id d2e1a72fcca58-82d0db53702mr12013569b3a.26.1775469516078;
        Mon, 06 Apr 2026 02:58:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e1e:b0:82a:5ef0:20fb with SMTP id d2e1a72fcca58-82d0db53702mr12013548b3a.26.1775469515578;
        Mon, 06 Apr 2026 02:58:35 -0700 (PDT)
Received: from [10.218.15.94] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b23c6asm17723022b3a.10.2026.04.06.02.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 02:58:35 -0700 (PDT)
Message-ID: <f2b9614e-140c-4407-b4fa-ef5d7c9ac0a4@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 15:28:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: wcd937x: Add conditional regulator
 control for wcd937x
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org,
        Jaroslav Kysela <perex@perex.cz>
References: <20260402072256.2811085-1-karthik.s@oss.qualcomm.com>
 <177511857667.2917822.6371182180784837499.robh@kernel.org>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <177511857667.2917822.6371182180784837499.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA5NiBTYWx0ZWRfX50OoyA+sqpUv
 97JK+rEHowsbhZQ3SCjSQszn6XaBD4j3q62V7mw7rNAku3oFWeDJqJvAdxGG5MOOvyBTWG2VVH/
 eJ8MjdhjRbiNTXV7n2Lqig7y5K8dti2dvc79h8bi3o/g2i+A9JYtwmlHzn10o/9bJfonAudRQUQ
 L7I4tR5ZnuuKIgH5JFUIQfOT6FmCBQCEQEwQ7iERzfdSAGjT2MXws657i28peVUup+pPc1c96t9
 V1d4WjjTq/qawGGISiUV/iPApMR7RaWdfz1HvKQ4EgR5a6vHbva7ePmndJ2fInOmUnuIGTuSjXA
 vz1WF7Y7YLzix9GuW7ldRvKLUd3qFOQ2bOvucHOMxdEyttq9aUWDGm7T587kqym/tVf9ZEO6C47
 9sdVLyZr2rF3FioHx+cj2uLvfV5JwMWCullx6g8wW+H9I5mpLh07O1m1OY6pp0H/eNQcA/6FjTS
 OUz+EfNrhapXAsaQDJQ==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d383cd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: VEWuUb7Q3M0Nen70k4fzYrGaISvOnTJu
X-Proofpoint-GUID: VEWuUb7Q3M0Nen70k4fzYrGaISvOnTJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060096
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,suse.com,perex.cz];
	TAGGED_FROM(0.00)[bounces-101939-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karthik.s@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 12ADE3A2B65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rob,

Yes, I was able to run the script as you suggested and find the error 
indicated. To address the error I have removed 'type' from the 
dt-binding property "qcom,always-on-supply".

Thanks and Regards,
Karthik S

On 4/2/2026 1:59 PM, Rob Herring (Arm) wrote:
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml: properties:qcom,always-on-supply: 'type' is not one of ['description', 'deprecated']
> 	from schema $id:http://devicetree.org/meta-schemas/core.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> Seehttps://patchwork.kernel.org/project/devicetree/ 
> patch/20260402072256.2811085-1-karthik.s@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in*this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.


