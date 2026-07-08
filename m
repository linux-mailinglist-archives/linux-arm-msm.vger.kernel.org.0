Return-Path: <linux-arm-msm+bounces-117517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D/71CtfwTWqJAQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:40:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A1882722400
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:40:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XbiYhGYJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OnQGj7Zs;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117517-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117517-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10BF5309128E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 06:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7EE3E3C49;
	Wed,  8 Jul 2026 06:35:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B233F3DFC7B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 06:35:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783492504; cv=pass; b=IsAuRb6NBNk+O98/m99oPKtg2+Al+kkZ1Iu+O3CgvhowJc4rtruVZ8z9M2Lh6Aai1jWWKuxarGz6my+yc+L8913Twfz7Kfh+1GbTwj3Pyt2gS9hgLFL8WlXnA0rQuh1JqabsA4kiHClP0u3yMzEVHWtUXaMy84mZ2uWvkT0TfAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783492504; c=relaxed/simple;
	bh=HQHMQxIaZk9tRRN5pVDUIzC8+5ADYKVLzXTnJo29n7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W4U5WZN3gXRrfvzoMzYQ1C7cqbw9s2YiC2i3lKHvxHWYf3UBGX/oXw+dCZPzJ6VaiVRJ49mK6s8oqFK7h6ommgeRgJtJSTzjRWeCAlVTbr/mngbeUakqohv/kDaNZKj7K/Y94JWrs/MdM/2vGYUPXtMpnhCyV+2n0YSpUdlEBMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XbiYhGYJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OnQGj7Zs; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842aQX1667892
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 06:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MhvJfiEOR/29UPGbqenV96kQ3jHY05K73WPO5qYby4E=; b=XbiYhGYJyV5Z/l4L
	wCToyc7Vq4D0l26EOhKjn5Zc1soAb9yKqfmcFlboMrDj7w9eJJR1+ilY9MnF7GYG
	VbOqGqu7YKaSsSBa87Pzlbkl0QlNThXZwsuGIb10yGOBB+zRy/UYrKQ+x0/LcNM4
	t+TWEAAvlAu+67aJVYDDhlpPMz+ZD0LVa3zcQYR4SCwwRZU3GuoW6Vl5S3Lx7kXp
	nRVC9DgZ2nJMYDIqyRx5Q95do2VuXr9S0xFuPxdDyZrc32adaCXNjnEhQ9I1tOcW
	eOpOq4e85UVuOCMAudnqEGnIaP7yXoAmMhTIHhl92lR5i4npRGGpdJb/uUTAeVAW
	iDIQag==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5u1yj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:35:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e934385db1so6135126d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 23:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783492500; cv=none;
        d=google.com; s=arc-20260327;
        b=PdXWD+vqq+lzzqbQAizjmeT7UJE/1cD/o/TKKdwK4+ScaRQH48lLqa+rlih84MURI+
         bVe5aAOwLKP+hREsBzNy27XjCMS9kvzAvZwk1g85uMowrZPcdKp5Qe/XwKHZyU2eD0jO
         FzZ9/34Uc2dRIxjztrTAdGZ6fixlxcpNWUmSjyinWOcu5TAJ7TEHdMO4VyMLcmB+N705
         nds/s4D8l/ZBOvOvmapsUlL0A6xNqeKBL/Ay6NHqUWOmUDwh1jaxTnUskprsVFmPteDj
         8OTb7wGtNb2Pyu8QwutUvcydxpldrmEP4YQPE9h7NJDJIiPcJ4FtUArEYETfPLO3QM7J
         4xNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MhvJfiEOR/29UPGbqenV96kQ3jHY05K73WPO5qYby4E=;
        fh=VrFZAkKDl8sS9MqjS+XyaEDxwF+rHQ5/Sh53CeK4to8=;
        b=fuwt7QRExt7KQTTWnvpQ+2kczMTAoP8W8ALzyPZAghbxihfs0NXzp+G8eYiwBNq0Gs
         XCJHA2ipYv6NeJIozL9GjowSrVqnkD5D1voFqOZ6wknQ4s/5ngeNiCIob/guQ9s9unvT
         700zboMiGn0AlnljlMp7I7rDzqu6bh1pqPsu9d60iWCq1BQczghVWFN2wySg0IUAuNhW
         bCdyK1RK4GdVkjNNSyXzzalieVinT40qKXdPV9bOzh+Xu7nqCBOX9D3DazN1ULpXUiOH
         C0z9fhp+GQL7kQCWTBv/O5IWLKWFMYbxj3obkJ4r7AdveaKUDZ+ZI/pk4hp55TsyEZhY
         DaeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783492500; x=1784097300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhvJfiEOR/29UPGbqenV96kQ3jHY05K73WPO5qYby4E=;
        b=OnQGj7Zspk/pqLz3paOkP5qfSGBQI6N1nM0h01YpA1/BJmPH2//hZzFPLa061YdwJl
         g+GXHw7ctYfcNyp4l44vwlFStyow+X/+1ZRH1sinmhN3E0fSV6PkaVZVaClMSxP0lEe1
         07vwIxIQAjH1L7bX/i6xbcvN9CP9m0MaeyIcszm3ycTAZ93lTgIcJgvZ4UXHg9nNavEf
         N4f6+K5Jv+RhqVGzlUfghtlFFyaNPbxttuz5dHTg/AyIVHGKIOqIHGrW8lq1/OFLQ/FK
         sTDVvU1F9cAHyXrY6rfnsAQr2AHqIK+fdOv2FxpYScW5y8m7bNJ8om7HF6+MiQkCiINw
         pSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783492500; x=1784097300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MhvJfiEOR/29UPGbqenV96kQ3jHY05K73WPO5qYby4E=;
        b=XXUrW80w/8VdcJwZHwKI+RCf/DOXfrQ6DaEonFKEeMorRB+GGaj3IJMvZCejrGwnME
         9lSRMza9JvQAQqQtLpX+DMLhO9oiCeW8aq1aWf9JqTJtIt5qYYREwhSdxDCPV0zG8H1P
         8fwcJy21LwgLGgn7zSMmiHVCeBG3bZXSGAXNep4cI1ZlWb1Wt1L0+WJrLIe+TcdbYIX1
         hG57ut7fNLsuQFzGGm4aPY9CHDRVPaC3Jy4uMJ0gVDeMKBXRM0XqPUQV5edPfEGN6Gcy
         pIR0PQErzqQVd3JOGig3uvNfiE+qCK/XUgEdJleeUzhZdM1KajSwFhBf3dvVWfn8OUh8
         LBJw==
X-Forwarded-Encrypted: i=1; AHgh+RqlUZgfxlLgzkRaFkLW5i41HeqyYsIFJ+davJy9wIPjNiFSL+d/vHx7xqQgOUlG2/TrfArPyfKQOIsYqWVV@vger.kernel.org
X-Gm-Message-State: AOJu0YwY3ojV8FOB36I9/XbU9Pjwbqh9/8baL2cdS3yQI4LKGn8r1gQr
	4LlRjRFiEB5Rc3zwq9T4NfVgAZoc58Yu1IaZ8YfsP5YrlmB36yKrgHzMHyWJrsB/eis9CTLyvpX
	n9GfZmSomhpv0PIHJjd1/CK72a4oktX9w75U3v3OqIv/vcg6Pg90AR0+X4poCPRviiN0exXyUc5
	NcTMvW5bnaVUrEEV+m56AZS0rR6BDYLRp+uNlduRnZOkY=
X-Gm-Gg: AfdE7cmNKafAKR4ejeWawVMuQ1dWyP91/EHXi6iMXxgSXH1Nroj+DC2kpIQ2frclv8O
	b9k5JbeitHo/59U6fBdyHmYizVdYe4VkG0Q3SA+HldBMVrcgPh1m20WTIfaq8U1Wrm0DCxhukGJ
	Rbx9hWVuN/NvKTAOnnJFhMeI3l9INZ8++QrXXWPgZN3BcgQ+C92BfnprU9dx/eN8IhB/FO9gPF5
	bhOImypLWba5lXwAHRh+dqp0i8wh0FjY6ETOkYza8YhvU6xJwuF/4Q/1pPd6Y9Drs7DOEhwhu7t
	9xcJcdOk4g==
X-Received: by 2002:a05:6214:1244:b0:8f4:8950:37ce with SMTP id 6a1803df08f44-8febd9e83femr10137576d6.0.1783492499746;
        Tue, 07 Jul 2026 23:34:59 -0700 (PDT)
X-Received: by 2002:a05:6214:1244:b0:8f4:8950:37ce with SMTP id
 6a1803df08f44-8febd9e83femr10137356d6.0.1783492499274; Tue, 07 Jul 2026
 23:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com> <20260707163703.233405-2-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260707163703.233405-2-srinivas.kandagatla@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 08:34:48 +0200
X-Gm-Features: AVVi8Ce3aT296uzyiYfMjfTF9OSvMfQFA6MzJcEjE5PtwBSndKXXLK4YSiFG-1k
Message-ID: <CAFEp6-2kjPxaw92c32NyWT4HQ+a0APh1ghYnGAprVRi3TsjRyA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: monaco-arduino-monza: Enable I2C0
 and SPI3 for 40-pin JHAT connector
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: sGta7veJNbfRh5VbnbaDj1ybfzclU5ac
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA2MSBTYWx0ZWRfX8PePwyefdCaJ
 MLM2HTU37/F82uZy8RkuqhDNqQaVMCPz0wMpN6oMOZTsfYDOwnWETgJWMSevl0tbRL+qfVXU4Bz
 FYpCNyrlh3z4S1V4K0ldTt+VHgbUNwo=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4def94 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=M_ErV1Mzh6uRu9SFwtgA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: sGta7veJNbfRh5VbnbaDj1ybfzclU5ac
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA2MSBTYWx0ZWRfXzA204vAeJNY2
 qinB824dj9ro585La1qmOk+/xPlBNO7qq5xBCXhB6ilbILiAhN5eVJtMAFlmcSqPOYhOR5u1pzi
 5ThVZ1FHRZYZBvvEcBA0/aIuOcbHNN9+nGL1NtnMl9vAilgoU1fxeETTU2jYTivU8oK8BEqBxHR
 EQ2a7tzoHLvKtrJzfy4CmdIzbUF9Fi/C0pKP5asFgC6xLiRUUihHeOMY9LfYCFFVX/NFJ55PmhN
 3Udebr54ZRGnotpP07d53Xm6cDKY/srjJFOBsR/KxujjbQST85SYcdGuoUbXMFLhsz82XJ3l4h4
 jdP+LORarb/gFkFdP4KJYLDw/8JS/6TXNjkwSxNR3A89y3VAo0yzSczzXNudW7YQtvEC7DRj4/c
 RlfcxG/UTXgnne/MaMEeDIWnYWEhyer+QO6Jd4Tv75pYrdSPl7+eLh6ScU1uxjMwaZ/6rqJKoPA
 IRNa4dmf0qsaHSW0u9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117517-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1882722400

On Tue, Jul 7, 2026 at 6:37=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> Enable i2c0 and spi3 interfaces that are exposed on the 40-pin JHAT
> connector and add the corresponding i2c0 and spi0 aliases for them.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm=
64/boot/dts/qcom/monaco-arduino-monza.dts
> index 8b3ed73feb6e..4b1975dff885 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -19,9 +19,11 @@ / {
>
>         aliases {
>                 ethernet0 =3D &ethernet0;
> +               i2c0 =3D &i2c0;
>                 i2c1 =3D &i2c1;
>                 serial0 =3D &uart7;
>                 serial1 =3D &uart10;
> +               spi0 =3D &spi3;
>         };
>
>         chosen {
> @@ -257,6 +259,11 @@ queue3 {
>         };
>  };
>
> +/* JHAT 40-pin I2C0 */
> +&i2c0 {
> +       status =3D "okay";
> +};
> +
>  &i2c12 {
>         clock-frequency =3D <400000>;
>
> @@ -425,6 +432,11 @@ &pcieport1 {
>         reset-gpios =3D <&tlmm 23 GPIO_ACTIVE_LOW>;
>  };
>
> +/* JHAT 40-pin SPI */
> +&spi3 {
> +       status =3D "okay";
> +};
> +
>  &tlmm {
>         pcie0_default_state: pcie0-default-state {
>                 wake-pins {
> --
> 2.53.0
>

