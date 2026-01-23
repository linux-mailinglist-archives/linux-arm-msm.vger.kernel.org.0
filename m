Return-Path: <linux-arm-msm+bounces-90282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHO9D7Ibc2mwsAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:56:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7877D7142A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 036E6301ACB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 06:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605C634D907;
	Fri, 23 Jan 2026 06:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2/i92SU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SI1H/5CU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A88D32C94B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 06:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769151242; cv=pass; b=nBqh1hKCAvhxq8kozMpDxe273KRk7d4nA47BII6oF6Pmn8e98Q9t6256LJ1kDAqi15D7xV9SfSZqUZpmoLyKqNRlNUC/Xa95YNQNvToy5xIWWN2KFSzN8MTDP9IdobwfARdQat7c0S7LOlxrETa7jYeEAZs0ytFidU5N3JaGhwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769151242; c=relaxed/simple;
	bh=s/FYJs2yh0Mn9e9zJI3uFU6aHvmEISj88LdCakLhM38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9N2l+S7zVgFQtSfZ2O2a+4N2DjopYgDE/YjL2MlX5vzXtLY0zVXY2/9yoBXwu5sMjM/GdKmbErdcM+armVq+pC8e1Yye3CwzIi8Rx5RzUEa+hq1dAj7xnUFfaUC0oHBEo1/q57ImuL8m8cgVb9nOwbl1Oigp0RxR6WhinovYEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2/i92SU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SI1H/5CU; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N477KV3811168
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 06:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0VLzkj7kBAIvIeyO4Yw8QzJDHtyD3yHiv4q5/eKWxs=; b=b2/i92SUYiaESdwo
	VjpgHSfUiI9ApnLF4g+bN9LAW7zupMgnhCP4F9o8tLoJO7gv+VIdRuAgKrfweDLy
	YiZLR7ffNcNbVFBysSa3ZrZ0kOuzbK4SK/MykF6F/4rmfOTJy/xFloC7XR/3Cm7a
	00MPHEI8J1dbYMJ/4d2KB+bpBTZ6ZWt5ay5qh5w2ArRGpwyGy5wTEDUuU88a9ISf
	RJZcc39lq2fkNIq04SmCjD7HPi4JCp8INMfsq8smh0uOtBljMhR81ImMqt7kjgJH
	onVApRORNsJUohMQArtR0lksWoi4QJHICWbMkiMzJi91TVVjajjnQ/R5efOFfgxb
	Ijc6AQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bujq1bs3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 06:53:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2d8b7ea5so21916836d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 22:53:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769151234; cv=none;
        d=google.com; s=arc-20240605;
        b=CH6Nnkj86qg1hgigCjiiLWDpuPyXvY4cCuArUjw2Um7cl1s2LtYQej3LVRFMFv7QwZ
         UVQ5WZJjwE75bXjMtvofXi6yM5fp9L5XCE8bku3qf/gl3mwQGVMP9cQlLBSkx9RJV83I
         LYae+TldkNQgP+QE1QVoO4FI/W3IMJmER7CwNpLfp1fLPMtfHjAyuoijXsPUP/ts9lIy
         Qz8vSbIzm+wKLTS3CrCrPREPv6j1HSojY1yvIT4oNFZIQBxM1fselK1j0DjCUcs+XFwj
         rM0RBG9zafij8Jc8dEq6edX4tbeSqbxdecEIcGLEYCJDqYdO8Do5z7fvNFdUKV6GWeC8
         ryog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s0VLzkj7kBAIvIeyO4Yw8QzJDHtyD3yHiv4q5/eKWxs=;
        fh=FAMG/R7g0xXeMfrwWufNdOhsBRERFw5XajiU7svpFyg=;
        b=EnqCfQqZCHlzGvfsKbdaB+H8DUuOoumvgkoCUJ0/xe52zb52rTeaT+gHE8xn+QTb4v
         FoRFAJX4Rz2TZOl/QYSh+pfbbEhYlX8aDDgKtaISU1hYrIRN+BLb4EjnyTDqNoGdRfgn
         P2Os4e5WXQ2cacHdkXtVPKVC1BKrRqd1abmIqr8z7W8jW2bjR8AzuacCcdskpIL9ykxL
         ibr1IOpRHii26S28OfLT4bWuBtvVtSFuZz54udGKd+kwwhdo9NBNQdEM3M7ytY1B8uEn
         vYvXzXfOBWKjei43f1umlgAkCh9TAbj2WM7dz0pcfFOu2FjbI1wnNxkoRPu2a36WgiaT
         EQNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769151234; x=1769756034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0VLzkj7kBAIvIeyO4Yw8QzJDHtyD3yHiv4q5/eKWxs=;
        b=SI1H/5CUAJRE1zhwCvHuQLPfVZgs/wh3gq7q9ChkLU3k98AkGnZz8JO8LKHb1ctwTC
         YMSNtqRA5+CHuZpMUZl1u3tldyBmyGpReolZJH3D8MF1YnCTt4EZoUGvbdJf0hNjgM3k
         j746wtmAlsrEeNwFvUydIESCsvEcx7mNzKloNywvaW/hwJlzNIrtofEtQ2S9umPu7X+B
         ZXE7+bN87a1aMBddyG9Z/ysEaSmCI2aJ18QJGKfa2oWQoTveVhXXjNuX1FIAa1oTvIE/
         HnwdNJTPbJ+kqLRdIgQnaKTB+8BiKp5Spr53QFlVwTk588CWALBzze2CMlGaPXB0zBM+
         1JtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769151234; x=1769756034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s0VLzkj7kBAIvIeyO4Yw8QzJDHtyD3yHiv4q5/eKWxs=;
        b=bKgEyig8OlfDmry+LnbBcSiTGcYdRHN0XMhMVp3kcf8eVvJjq3SrgSg5YhPoWsMigk
         Vyt6IBN4gSdSaeWxfFR55vYKq7rFpJypsZcpKaRN5RmW4lrQGy8/a8Tz1NvBXHy/KCOf
         JTrVlXh3hq7Lkg42tdCLTicHGhNcGFS7doYYVj3TDMM0YumO4ZIfDm+By4K2bhP91n+C
         sUY9dl4su8L3YnapV0DIwOU+Q/zXcrpUWsuF/x29JZ7wUYEphWdEI8WnUV4m4VCmxxhv
         wqhrF0iFkWytlE2ZRDpMeyJX2tBFWszKvT91JSmWx0/et/kedkilPsxL6wLz0yM8q8Z3
         5svQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDi8p0/vpJWrBX/PJruextdl88E1gxgDCMj5ss6dTpxyNR9vLQ76ExEt5er4RIulw53S+t1MuA3wrIiU9v@vger.kernel.org
X-Gm-Message-State: AOJu0YwOYfLsn/72PPhx2aHZnK7TEs5Zrp5KHhFNfvugtTWxo/7ZRyPt
	FEtmg5QPgp7v8AqY+4xp/CRavSvGIqvNA0miY2MZjCCMq/uPBasJY9hrkk7PlEn5b/jq0PNnDt8
	wxe0oAq5mej10Udq16u5o+t7YiyE71pu5XK1rG7Lf0snYDlS80aOcy7sdBzy1TWSSDI08Tio1Db
	dHo9zrQg7EK25vTe8/ky+yYH8xu8Rg4MkMIDieBYuYWv0=
X-Gm-Gg: AZuq6aJh8qgrFiWdo6tTSPZPiLz7uy/3RRyrcxSz2IEs6HVa0EVUtmadJ49/OKzjq9w
	jDFXbpnYfhKqNOFB3aVBmOwzE+sC/n1vKJi1lYyZBUZqThXnP6T75Q8X5NAomK00fuvD59fQpBj
	opxUkF487J5T6Bf0rWSLxrdz8I0Vvn6NxvLowWOLrc+d/NPwXWg+1q5/3WmCvg58Ld+v1FgGdh4
	A7EXpZLx7pHRN+cljEYSiJc
X-Received: by 2002:ad4:5def:0:b0:880:63b1:3f57 with SMTP id 6a1803df08f44-8949020d656mr29225236d6.38.1769151233744;
        Thu, 22 Jan 2026 22:53:53 -0800 (PST)
X-Received: by 2002:ad4:5def:0:b0:880:63b1:3f57 with SMTP id
 6a1803df08f44-8949020d656mr29224416d6.38.1769151232692; Thu, 22 Jan 2026
 22:53:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com> <20260122-sm6150_evk-v4-2-a908d49892e7@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-2-a908d49892e7@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 07:53:41 +0100
X-Gm-Features: AZwV_QgW9xaHk1V60VCFg-RSltJOSQPj7qJ8VK_VnWofnB4yGozL2VT2va8zIr4
Message-ID: <CAFEp6-3qrfnn5EdLXX1+1qGtAZa=L4QS1nyCs23JnKq+oy=pqg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: i2c: qcom-cci: Document sm6150 compatible
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 09Ylsgfp-JjtBDfs-xlDE1AwP5gmyzT9
X-Authority-Analysis: v=2.4 cv=O480fR9W c=1 sm=1 tr=0 ts=69731b03 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=AGkvFC_LJttw-4NvuOEA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 09Ylsgfp-JjtBDfs-xlDE1AwP5gmyzT9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1MSBTYWx0ZWRfXwTb3NKIesUGe
 9vI9usfEghlK5lpSHzeJL6FFN612+KmjLU7LATh2lt+BbQQJPmjv9gNdRDI/tRAnu5M/2dOCnx2
 tM6fKGQnvy+TbwY4XazKM5wFE3e9qPdsWE1mHZzoEeIBO3ITaEVXh2GJJohBr2MYp6KeaQ+erAZ
 dVaNL98V+JWoWEwndcxGG3zwIJkbHWDrbjUUTtlNo1JJqZsrBnN5SVfeUhhT8pUWB2Xe17YBkX1
 HxW63xgTUpNk3eSXTp14ho7R4GMKKuauSxUeqSVw/mN0iRd2alpCe729MB8owzMbd33B8fq9mlU
 jSE0statACHbdUDlXyKg/q6hLgzWTs7NXH0ITJuW0L58PXZ9wrafHxP33sHvl29JOpRHD7Hgo60
 gGJgYsqqvgvSjqlVWZmB7exlayUg3VNfhIBjduokqx/KK0hHLwjV628uoG5o5ZExLWreh+bc3TW
 QkbUnRfSwomveTpTDkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230051
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90282-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid,linaro.org:email]
X-Rspamd-Queue-Id: 7877D7142A
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 11:41=E2=80=AFAM Wenmeng Liu
<wenmeng.liu@oss.qualcomm.com> wrote:
>
> Add the sm6150 CCI device string compatible.
>
> SM6150 include three clock:
> bus: Bus clock responsible for data transfer.
> iface: Interface clock responsible for register read and write.
> cci: Clock for CCI core operations.
>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..d3f87da54fcc14a8f808f34c9=
4551583d8deaabc 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -33,6 +33,7 @@ properties:
>                - qcom,sc8280xp-cci
>                - qcom,sdm670-cci
>                - qcom,sdm845-cci
> +              - qcom,sm6150-cci
>                - qcom,sm6350-cci
>                - qcom,sm8250-cci
>                - qcom,sm8450-cci
> @@ -249,6 +250,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,sa8775p-cci
> +              - qcom,sm6150-cci
>                - qcom,sm8550-cci
>                - qcom,sm8650-cci
>                - qcom,x1e80100-cci
>
> --
> 2.34.1
>

