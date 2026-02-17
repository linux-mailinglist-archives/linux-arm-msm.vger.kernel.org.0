Return-Path: <linux-arm-msm+bounces-93205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iImYFL6YlGkoFwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 17:35:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A620914E432
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 17:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A227302F3AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 16:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1889436EABE;
	Tue, 17 Feb 2026 16:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ntyiyq00";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jv0U0c7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44B336EA95
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771346105; cv=pass; b=YIR6s3ip0ViaOIAtjqXMrFkHHclQFM0uu62Li4HhLnVKDnoEcKJTSM0ED29UhqeiJBNuhSGwBAmY27opgYEK68/Japm06QBHTKgIm5IMddlYG4dJ3yEEZQlXbzGfzBY9hCpxKBMMFoZNtzV0kfPO+44KDMoFYYBVKxSGMKayRns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771346105; c=relaxed/simple;
	bh=fOduQHfnOBnWN0eyuIDOU1ydKPk/q90IXpg/RDM1QR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C0FKN0bSwTK/FgrtF1e/PMxAk9NNyxvNW7KdjJgpxZQRrqzicMUgdLDlY2UWrT41PtHmBRaYyu3u6lQLndi6bSHnNfB44xgiS/li4yUd9YfbxSFMI8VvVnQ+tuU3knE2SIW1zefz7GcUUfjQM91ePUV3QuGXE1zNFoM7LFRRb8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ntyiyq00; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jv0U0c7v; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HFUFVq2319832
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 16:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMRely7AErEzRnlh5Io/kCgcffqQUskngQe8L7efOeo=; b=Ntyiyq00RWaM+fc/
	TUC9DbjyNOs9Japaw2XM8AzuljQaLriO0RaRNhzZ+M3n9GsPJAarbHbNpp6/PEET
	gseZBFEhAk9PFvKbcuqIyVLHbWpwFEMFeIDirSc1YSbOfN/yqyinzYH9i+VfCdBg
	kDFlAw9zf/CAG7A/WEcdtMn15P6upTitTGeFiniShyJXTSG7O3j8MyA8aIcKzfAr
	Q+7Tn0Vt/pa3U6/q99jGevTHoj3vd8AP+ffcTFEdEK8hI/K7CbzPj0WWTsiqxGVx
	UA8XNebusAFfwhYn8V64fiLlKGkejzO6A3SOPbVqMXcxcDe4mkWA+RlmB/lg5Dya
	DtxXDQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccu1er79p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 16:35:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506c0da79c5so269369921cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 08:35:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771346102; cv=none;
        d=google.com; s=arc-20240605;
        b=PPPyTQ24JzMlC8q90IOZ4gb641JJLooMgjVUYwzQRsjS3AwGqn7f1aCeO80VCIIxHA
         5bAdT55cZHE4CqZJBZ4NjGJ68tBBC/YQAk3Luxh1au7lKtVBPJFb6b7JgwGtiTmELtoj
         pQ6vPO5g1jjZJeh80/CaS9L1V2+UXNT55kfzXFrxj5n0yPLT23ktjjHb5dOOKZeMNuKY
         IkD8DgBOF6oM0Dw54dRhoAdNryNVPpVPp565pZPCqL4qVbQtJkieSIdO5YpCs7IWknl/
         /WCCKtpTXjk+8afKO4WZ5RuTUhaNoawGIDtopEhxPzlnmpto4btdH9Q2vZLk9JsZ+uzZ
         8fjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PMRely7AErEzRnlh5Io/kCgcffqQUskngQe8L7efOeo=;
        fh=qcc2JiOTAfnQP2P0jFeUnoQ7gTu2uc+J8Fk/hjk7EZc=;
        b=GW5DkOCiFpXNKTk5yuFPYvF+Czl67wHnSR5q7e90U8ptqF9CwhYDvEEYvH6Szu6Za7
         OpgdntJchtjQKrYsvwne0TgsDTDYNszeXGVTu91VEuEGmMChBRyxZoGCfTueoETpwz8I
         J7RP2lcVoSnTsn0H/RwP8tgweCGW2CweO7UPdLG0ys/E92JxXOvtMAhKwHgVlsrmTOjO
         DwdznQ2cXZ1g7GhRK+4jq4onG/YM6brEYE7O/NvIRqvDep6nSgRrnkSgafIo29/XrUeJ
         QZ1UkUi4Fyb9ND/W5Q6D7LCvVH7MadKCRG6oAHk9VNZHUJ645ghqBtgZbGp4QAQRvt71
         tYTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771346102; x=1771950902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMRely7AErEzRnlh5Io/kCgcffqQUskngQe8L7efOeo=;
        b=jv0U0c7v3kBIS3xZr/Fpl9OHCwiHk/0345qjt9aqm5ImZAY+H6kNo8/aoYApoGV3Sx
         wRoJgSgBqmUyWV7zebznE3oeD/NvddnlppUWlAVQOGG+WF1B3M2BQNZA2lHKBn4E4+3T
         Lv0pIGEEJpdd3OzN6R9aUgoXrQa+Iw/O6/KN9boZ6x8tQET5Un0zmqRSdAjQFbLHZohI
         bmaaYgRBigGMLnNqT6BYZ2XLHnP8rEmd54wy24Ey7LjfxiemKs+i2VvjPAJUYIL+Aqfh
         0KjJaEezQEqLTyZyiEGFJAdGkATWcPIoFpj/sbO0JI0/Tca7yrqbjPrO2VyEtBxyTIJL
         05qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771346102; x=1771950902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PMRely7AErEzRnlh5Io/kCgcffqQUskngQe8L7efOeo=;
        b=HQYh/KplcXT0vDYtiXSZe/SiT5IxiPBt0ECzqh/nY3H38jucbP6U6/zGn89YB06fUw
         ui8exZVtJn++rywrZz3McjgR+193EBvEgmS4Uy7MTdyKA38dlwAeuoh4dqFqceic7Lcd
         6EhohFX0T879uWTy/y07Fcys0Qaaqpnytkkm8uNYpb0aeJQjDI+fLYe3SHjAumN+r/Qp
         YDCiZSrcSIMEmrSzur5nyDcvcDdIwap6SZwN3b7irfKi6FeCBlCIN34kluo91sNmAJ8n
         DeC7ZoszwuLA9r6yJEYkeJ85RqFrChlOw/2HBJ/koXoVdX051RnXSuJhubXBkfyEQP6s
         QGTg==
X-Forwarded-Encrypted: i=1; AJvYcCVSQW3N/t7GCTqAUBCIk7xM4/Ysa1GiViWQMOjLYQ2nALtkETPCwu6/oji+DHPq64Jk68ibciwB18YmMZ5O@vger.kernel.org
X-Gm-Message-State: AOJu0YyLLopQfA7OPGP66dfKJi6H3wItJ8TNl+hWCBXj8l7uD8DAmdeV
	6pkqpZYezeQs4ZhfVXGFmzc4p1nPR10MBpImk39xDYHtCJSc0zcK/hpvAn/UmVpS3FhqZEIZ6jr
	szwNQdkbHlSO2oEbd5GlaieZpPADAsGEH3KflLxpXmZokVdswevADdD39NtYBRUKmQJ+U1RkMES
	RPrjhXyEvt6Y+bOYTwnbGRiyi51uWiIB+W8GdQfQ2FG5E=
X-Gm-Gg: AZuq6aI2v/IAg0//CDudRXoMRj7QU/YNYoCVVbU4ZyY/ucHKv7MwlPKA0XwlkGhzh9Q
	hdEzhKekze6khj7XtnoN2JMpVUsBw+Wtl+wGXywXgkYRuHniO8jFy/MvTguW2onS/jrsZvo8LY7
	9MNSKVo1Nijk0T+f465TxC392RQM5SecQeC6z3E7RkZtiBnez1JbpAW5IM4mr1cCCegmakHTOOv
	TrEt/arzSVqNH6Zonxu1Ut0D7BeayZyfTH7QNp9
X-Received: by 2002:a05:622a:19a0:b0:502:f07e:8569 with SMTP id d75a77b69052e-506b3fbdae1mr151322621cf.35.1771346101952;
        Tue, 17 Feb 2026 08:35:01 -0800 (PST)
X-Received: by 2002:a05:622a:19a0:b0:502:f07e:8569 with SMTP id
 d75a77b69052e-506b3fbdae1mr151322301cf.35.1771346101540; Tue, 17 Feb 2026
 08:35:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213132058.521474-1-quic_nihalkum@quicinc.com> <20260213132058.521474-2-quic_nihalkum@quicinc.com>
In-Reply-To: <20260213132058.521474-2-quic_nihalkum@quicinc.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 17:34:50 +0100
X-Gm-Features: AaiRm52Qb0GupIhPu3JDqFomu65fscXc6lKfjuE2PWBiawURp4h1BFYQGueyox8
Message-ID: <CAFEp6-2N21rzNADxPyaLTO4N0vWAoKU13oQueRsC9Esrw-BKOg@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Cc: bryan.odonoghue@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, rfoss@kernel.org, andi.shyti@kernel.org,
        linux-i2c@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
        quic_svankada@quicinc.com, quic_vikramsa@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LfsxKzfi c=1 sm=1 tr=0 ts=699498b6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=SK6ENzGRsuaxshVCMHcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kusv8WWA18Qq-n8Ak5F4uqeyHWWfY3rj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEzNCBTYWx0ZWRfX9Ld0CKKyWH6v
 ntLElfvhMMaO1TmVrtbfpF2O5OOwWgV/PSeikDFjkoO3rzZ4+Ruvi4p/C/GpQykzKwCf3Yc8yLA
 gYtDacclYDVnptlgtQddooHcDRvwwGZUHe4oukCE7pjq2myy8OrWY+44/MDWTODhPolcrb7eS0q
 36i1yiTmSJjPXBIRYCKv8VxfQzyN2VQAUJsSuUitc7nlr7h1CzolmB8PtDy8RwifwePP0ELMMvn
 hMo8yvphtdhCPlSCo4Y/Ey0vGxYIDAYbO3DOPJtNNxv1jmRy63iAzffSFMJUicbfQmIhzyhDM9P
 Da6cXTqxH0lN3e8+ZVppbxeXCiwZbzfFbHmxVRRgG+i4MCXrZIPPmuUbIhpsmLpjZOug/wd8iuU
 8plUp9pZmhIHbQmowGR5T9b9f3u4QLXKne6g988Wgd16cZaovREYN9boae6V5M5iijp9G4xOmmC
 gxuqAy798gV39dEvAMg==
X-Proofpoint-ORIG-GUID: kusv8WWA18Qq-n8Ak5F4uqeyHWWfY3rj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170134
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93205-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,xs4all.nl,vger.kernel.org,chromium.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A620914E432
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 2:21=E2=80=AFPM Nihal Kumar Gupta
<quic_nihalkum@quicinc.com> wrote:
>
> The three instances of CCI found on the QCS8300 are functionally the same
> as on a number of existing Qualcomm SoCs.
>
> Introduce a new SoC-specific compatible string "qcom,qcs8300-cci" with a
> common fallback.
>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index a3fe1eea6aec..399a09409e07 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -28,6 +28,7 @@ properties:
>            - enum:
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
> +              - qcom,qcs8300-cci
>                - qcom,sa8775p-cci
>                - qcom,sc7280-cci
>                - qcom,sc8280xp-cci
> @@ -133,6 +134,7 @@ allOf:
>              enum:
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
> +              - qcom,qcs8300-cci
>                - qcom,sm8750-cci
>      then:
>        properties:
> --
> 2.34.1
>

