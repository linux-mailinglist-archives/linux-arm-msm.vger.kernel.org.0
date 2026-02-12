Return-Path: <linux-arm-msm+bounces-92646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJuYEWaQjWl54QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 09:33:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D4712B5B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 09:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41E7D30A5CE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 08:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86142D9782;
	Thu, 12 Feb 2026 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pz1YHBlp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="daUQLL4e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DE02D7DF6
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 08:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770885077; cv=pass; b=Sfn8MA9jjv00XGZynMvmKG2rTqkbU0URSJcKR0d/svZBGXYeQxo+DDiQkeL3vsopaNzm0NIgR/Nv4+6EPOOG+srVQF7cqVqcEPe3zjLrPxqaMrBTtjZy5KiIcJskxdfgZESxs+wFLAfKJO0vI5siidt/Q7zh7LKqsOK9D0peif8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770885077; c=relaxed/simple;
	bh=AbqZ0F/4suD4aG4hXU9S7RiPtsGKmtxhUmFHtOFkWj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQHZU3zwtHU8wcZlz8vy5nrx4iRI7Ioyjl8mvYb5PKrAXaHfNOTWxMVouixhKab+EeNN0zq3xlZ1RHQcVRZDRTTMraKtbO8QWhDPTYHg+4iK00+cIEyGAYKaH8Dh7TLt/AMPJEoFgfzGFulR50q9wX9k360jRzl7T2kuBOSUwcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pz1YHBlp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=daUQLL4e; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3SHSt357676
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 08:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qI6SkHFuYlClXM2Bp1KC8h0rJJ0qy7+metZp1f11zDM=; b=pz1YHBlp0OmjvxVh
	Q9TJZyfzbsWtxpLYQuOl3b4UxbroblAvPIZSFRkFW4JoFL388tPUz4tUkzSBQGCc
	aA9FKSWvzWqZ/w+F62viV0bKhPSHTBa4TfCEXPLOPf0lZCSfL+aB6HByhmZ1/fwF
	41wg/zgEqj2iTVeOJ8b3Hlct2us0ljIHwdKQfS2HbbGqJQbkjFqmf1jFuKN18hbE
	11ZC2qUZYwoHOdjuw5EgOSriBILlAkmUnHKnxRX+J34nQVxYt8vU+LvnEJdxCdYT
	mts44JSvsmj8+OP52wCQEt4iMhRLo7/oxR1eDRqKgaoiueLFf1UTO5k9SKvUdcSc
	Drfelw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8uy6ayq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 08:31:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ca06e38994so1696017185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 00:31:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770885073; cv=none;
        d=google.com; s=arc-20240605;
        b=SEvmBRbpR4ZqgYweg++7KIudZJR9/5XA1sUteqkC9Ak8FVtuSlGwwhwWeLvEKPQXgw
         GduMsnLv9FT3/HtQQyqJn2r4qUlq5n3jSOZ/dok2kk584ah9zDNSABUbzy7LEBOIFeAi
         eCepsXhOb6P+LFAPiCFjb0gd5Lnp11jkLgj3wlwMlGYDCdS3nX04YKgNTBFzIa3iiSjU
         SiP9HQNAClDI25qSLyjJfUFp/z2LGTFY0CtdnhqaGEwTShOAw5ivmJ8Eq3jPb0sGtJjT
         gtKoe3uI3ZRPbY81VWvv3eDwkPmfF3vCJ5aCxhL+oQOKapu43QTi1CDwErQg6TSsSE24
         5eFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qI6SkHFuYlClXM2Bp1KC8h0rJJ0qy7+metZp1f11zDM=;
        fh=A4Q1lKyb3T8rebu7olyZTibr/wTPeZ/h7O1qQQdP3dk=;
        b=TBbW/xH7m7Nq62L7+Z3IRv70Q8rLShjKgQfEOj2e/+07L6oTcTz0oZmJgzVwc2fNV3
         dNTioMS1hI2vOE6XnJbZNLxRj995dqYjC0pV/VQ1U08KQpbYF+gXu4/BXR3gN4o0oOtK
         NyUjfJJbqhizpy9dqSihoz2sTXL1dRYPwbsfhGAYRGylZFIBC/b/yBdx58UbwxomT+h0
         vWcYzlNDKzkivEEv3z+O++eOoVPm3CjGhSLhclyAvvonQjhpKlbk6XtieU4VCulS9tQ3
         KmCaIxAZsBzaONo5j1ntI9P5ubn0p7KItyhKJIH0RPveEv8Xle416x4/KBUxm2CRIh2K
         aRiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770885073; x=1771489873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qI6SkHFuYlClXM2Bp1KC8h0rJJ0qy7+metZp1f11zDM=;
        b=daUQLL4elmtysAfh5WnkxHKBXAo//3HqVz3n3wEFnnmUwtZ/QNW7Iggl9m7Brw1J/z
         Mf75A/mn0vwIjpZGc8o9gUVC/7GtEtjDCU3GL578ngsDYBI4zKGHN6BvWPdyaFqEP17A
         Bzck2Sn+YmpUh0nXFFjXo7Mcn48ITh7LidlXOpzuJ/H7Qel4p0KCy6LiaX4p8BoxjCI3
         9NqBLf+adi88jiolD1dLbB3jbLtZzT3p+Vs5Ulew2ug6nn8nTVKz5RS5WYjRhuPa7Bct
         69IIcudN+jOQo9kH+1+sW7EbBnBDDtZDzINkgPlgJWLSrcy0CbPijtfJdamrlC0y4HR9
         r5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770885073; x=1771489873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qI6SkHFuYlClXM2Bp1KC8h0rJJ0qy7+metZp1f11zDM=;
        b=c2TiFDNdHBk7qjc7AWq6thL1fciMekX49EY6Uct8izSwbwcJDRnn3sFFJLgMzFOldg
         NVctAeQ9ke477qQ5JN4fHhQDw6pX6nEHbMhrDliS/DnQb9Y0/5/1pLenOJQXsEZMcali
         ew910FAIkNkqXNC3lUbtv1DoC59UNyA39xDXS3DU07vTv1OomS5YTJkWTAINHmHU+t4Y
         wPIbQpm7vBSkcA1Pt0Le5f9f+o97DnHk88H6eRFIm1sOvQ8uoFGSV90wk4dTMNqIU+jp
         0n9vZj2TxOvMojSSnzLH1dGUiANuptU7xHp5mh7y+8fUsDziGSCiMObqjsmIKkOvc9dR
         8lWA==
X-Forwarded-Encrypted: i=1; AJvYcCUR5pTgIK0vGuuu9jKQsCE4f8yQ3APGVwJZevI8GjaFyiy3Sk48w6I6Umw6UOAHfdhJPuLWBwTl4wB+1yHL@vger.kernel.org
X-Gm-Message-State: AOJu0YxGSaK+EWJJV0SErA5wSfx8WavgIeJtWQZ5NOTXnOGVVoGAoW9d
	8DF/B8DBnny09Wqr24+IEU9HIQYuxTlinOL0UHFE/hChPtGs1DMuDMer474pVZEPe2HFZAg19Yf
	EF9vDFJzIz1u5OAFUHkvNvWdOY9x3GbJFrZIPQfgST/06mITRaOp6k5QI2xTmZ4e9fH2OkjcOUd
	2My+n0+sjANYkNYhxPOVoqXcFziB6aflQ4yPi/ZMCVgtQ=
X-Gm-Gg: AZuq6aLQKmhgouueYZK6GKIXHpWs+kjPUHlJUmzXBTFK+d5hGpQZu/Yr5w2ARs2NOMY
	Isj3CXUBWIBDAk4qc0BCmb2PvFlRsa0pEGM6kJr0Zd+eoJ2p5Szp6M0/vNL2iXgq3VES3Yg87fW
	QjDxRASaPzbnpCrwkV6LIl729ZPNvx7RhP3dxGYSLq9geuEPJ4JjNVF+qAdcfW3amQBH66gnwB+
	OsolmBiG0wEBK4CBUVaj0k7X9RN7Ph6G1d8GwZP
X-Received: by 2002:a05:620a:254b:b0:8ca:2f33:6472 with SMTP id af79cd13be357-8cb3307aa0bmr256830185a.22.1770885073509;
        Thu, 12 Feb 2026 00:31:13 -0800 (PST)
X-Received: by 2002:a05:620a:254b:b0:8ca:2f33:6472 with SMTP id
 af79cd13be357-8cb3307aa0bmr256827585a.22.1770885073068; Thu, 12 Feb 2026
 00:31:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211-uno-q-anx7625-v1-1-677bbcf63668@oss.qualcomm.com>
In-Reply-To: <20260211-uno-q-anx7625-v1-1-677bbcf63668@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 09:31:01 +0100
X-Gm-Features: AZwV_QjDhd8srUKpdqk5FW37dWB9y8DegTCl4HIlZmKlu_YuKRglUllsb-nr1d4
Message-ID: <CAFEp6-0Ru1qf5yw64V2NJQPWXm+L8QT5+t3mVEU6jMyJPMHDZg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qrb2210-arduino-imola: describe DSI /
 DP bridge
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Riccardo Mereu <r.mereu@arduino.cc>,
        Martino Facchin <m.facchin@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA2MiBTYWx0ZWRfX6jsy3gUKxVDe
 ORmLyuWvX0FNv3WvB/gAV0uTYKhB7meKxzHWjV+TycNPvxYt7+Tsknkh8Pvjfa3D6m6wq3Oqx1j
 ihWPzFXd09gUZUNWji/mpEUdV5ci2dz7nkO9igLg0ZiBkr31N94nlPkw4piOGzXYE4Z4iN5En4k
 1hPxF73UeQy4BvFndOHePKh2BxiAW8yizNhaH1NXXuIV4s+REt6nw58yZ0hTkAAa4BwkTByK7Kf
 Kvx2cKmqmS7nbHmxJSVrhxoqa1/NSY3ifwwDtSVMs37/1WMxlDriBYymcWszp6aGqaW1+X2WnvH
 u840dyvBmdVLl37U9XP/tEIVc0TipoFFiZ/iBXTLG70qYW/ebbfLzZYHVgw5QEVCT1+Dns7WDmZ
 nHVrqKfuvQ29x8/rwWkNtpZKZPaUW2+Gr91PUDPACPdqerACvZ5kfPNF7UeYsJACJ+fEpgfNAdk
 QC9FJ9lroHV+pMDIFQw==
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=698d8fd2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ODKxnnqWvjNKe2Q0mXsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: i7cUpb4YmVnXg6u9rj2nuDWm9utMHTjM
X-Proofpoint-ORIG-GUID: i7cUpb4YmVnXg6u9rj2nuDWm9utMHTjM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arduino.cc:email,0.0.0.1:email,mail.gmail.com:mid,0.0.0.58:email];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92646-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 93D4712B5B2
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 10:28=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Aruino Uno-Q uses Analogix ANX7625 DSI-to-DP bridge to convert DSI
> signals to the connected USB-C DisplayPort dongles. Decribe the chip,
> USB-C connector and routing of USB and display signals.
>
> Co-developed-by: Martino Facchin <m.facchin@arduino.cc>
> Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
> Note, to function correctly this patch depends on several patch series,
> fixing the ANX7625 driver:
>
> - https://lore.kernel.org/r/20251218151307.95491-1-loic.poulain@oss.qualc=
omm.com/
>   (part of 7.0-rc1)
>
> - https://lore.kernel.org/r/20260121-anx7625-typec-v2-0-d14f31256a17@oss.=
qualcomm.com/
>   (part of drm-misc-next, to be landed in 7.1)
>
> - https://lore.kernel.org/r/20260211-anx7625-fix-pd-v1-1-1dd31451b06f@oss=
.qualcomm.com/
>   (recently submitted, hopefully to land in 7.1)
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 112 +++++++++++++++=
++++++
>  1 file changed, 112 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/ar=
m64/boot/dts/qcom/qrb2210-arduino-imola.dts
> index 197ab6eb1666..ba3f0c74e814 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/usb/pd.h>
>  #include "agatti.dtsi"
>  #include "pm4125.dtsi"
>
> @@ -109,6 +110,16 @@ multi-led {
>                 leds =3D <&ledr>, <&ledg>, <&ledb>;
>         };
>
> +       vreg_anx_30: regulator-anx-30 {
> +               /* ANX7625 VDD3 */
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "anx30";
> +               regulator-min-microvolt =3D <3000000>;
> +               regulator-max-microvolt =3D <3000000>;
> +               regulator-always-on;
> +               regulator-boot-on;
> +       };
> +
>         /* PM4125 charger out, supplied by VBAT */
>         vph_pwr: regulator-vph-pwr {
>                 compatible =3D "regulator-fixed";
> @@ -142,6 +153,83 @@ &i2c1 {
>         clock-frequency =3D <100000>;
>
>         status =3D "okay";
> +
> +       anx7625: encoder@58 {
> +               compatible =3D "analogix,anx7625";
> +               reg =3D <0x58>;
> +               interrupts-extended =3D <&tlmm 81 IRQ_TYPE_EDGE_FALLING>;
> +               vdd10-supply =3D <&pm4125_l11>;
> +               vdd18-supply =3D <&pm4125_l15>;
> +               vdd33-supply =3D <&vreg_anx_30>;
> +               analogix,audio-enable;
> +               analogix,lane0-swing =3D /bits/ 8 <0x14 0x54 0x64 0x74>;
> +               analogix,lane1-swing =3D /bits/ 8 <0x14 0x54 0x64 0x74>;
> +
> +               pinctrl-0 =3D <&anx7625_int_pin>, <&anx7625_cable_det_pin=
>;
> +
> +               connector {
> +                       compatible =3D "usb-c-connector";
> +                       power-role =3D "sink";
> +                       data-role =3D "dual";
> +                       try-power-role =3D "sink";
> +
> +                       pd-revision =3D /bits/ 8 <0x03 0x00 0x00 0x00>;
> +                       op-sink-microwatt =3D <15000000>;
> +                       sink-pdos =3D <PDO_FIXED(5000, 3000, PDO_FIXED_US=
B_COMM)
> +                                    PDO_VAR(5000, 20000, 3000)>;
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +                                       anx_hs_in: endpoint {
> +                                               remote-endpoint =3D <&usb=
_dwc3_hs>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                                       anx_ss_in: endpoint {
> +                                               remote-endpoint =3D <&usb=
_qmpphy_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@0 {
> +                               reg =3D <0>;
> +                               anx_dsi0_in: endpoint {
> +                                       remote-endpoint =3D <&mdss_dsi0_o=
ut>;
> +                                       data-lanes =3D <0 1 2 3>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&mdss {
> +       status =3D "okay";
> +};
> +
> +&mdss_dsi0 {
> +       vdda-supply =3D <&pm4125_l5>;
> +
> +       status =3D "okay";
> +};
> +
> +&mdss_dsi0_out {
> +       remote-endpoint =3D <&anx_dsi0_in>;
> +       data-lanes =3D <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +       status =3D "okay";
>  };
>
>  &pm4125_vbus {
> @@ -361,6 +449,22 @@ key_vold_n: key-vold-n-state {
>                 output-disable;
>         };
>
> +       anx7625_cable_det_pin: anx7625-cable-det-pins-state {
> +               pins =3D "gpio46";
> +               function =3D "gpio";
> +               drive-strength =3D <16>;
> +               output-disable;
> +               bias-pull-up;
> +       };
> +
> +       anx7625_int_pin: anx7625-int-pins-state {
> +               pins =3D "gpio81";
> +               function =3D "gpio";
> +               drive-strength =3D <16>;
> +               output-disable;
> +               bias-pull-up;
> +       };
> +
>         key_volp_n: key-volp-n-state {
>                 pins =3D "gpio96";
>                 function =3D "gpio";
> @@ -428,6 +532,10 @@ &usb {
>         status =3D "okay";
>  };
>
> +&usb_dwc3_hs {
> +       remote-endpoint =3D <&anx_hs_in>;
> +};
> +
>  &usb_hsphy {
>         vdd-supply =3D <&pm4125_l12>;
>         vdda-pll-supply =3D <&pm4125_l13>;
> @@ -443,6 +551,10 @@ &usb_qmpphy {
>         status =3D "okay";
>  };
>
> +&usb_qmpphy_out {
> +       remote-endpoint =3D <&anx_ss_in>;
> +};
> +
>  &wifi {
>         vdd-0.8-cx-mx-supply =3D <&pm4125_l7>;
>         vdd-1.8-xo-supply =3D <&pm4125_l13>;
>
> ---
> base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
> change-id: 20260211-uno-q-anx7625-26f8fa8360ca
>
> Best regards,
> --
> With best wishes
> Dmitry
>
>

