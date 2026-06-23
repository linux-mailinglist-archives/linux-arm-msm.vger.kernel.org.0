Return-Path: <linux-arm-msm+bounces-114200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SodhFEx6Omqd9wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:21:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3AA6B7083
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:21:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Xojd0zZn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ksLSBANC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114200-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114200-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CD0830FC76D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6188A3D5C0C;
	Tue, 23 Jun 2026 12:18:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F78826F2BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:18:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217095; cv=pass; b=KXwhiT2nyrMQZ6Iu2kngMJeks7cBBI8Ra91GN1W2uY2eqCaN0IJw1mUV4yqD85jc2u3HLz8emkt+pRul8n3FH3lceq4s3nsNXyq7Qc3DenP8rhHZd4It3fhJFsbYj6tKlPDAi8zvABGOwZiD8qzvG9uJnFbn1arSvCBwHcb7wNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217095; c=relaxed/simple;
	bh=a0JAOOvquFV2mJKI+AEZWdNC60V924jZEjFC8KAQ4Qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uw1g5gwRBK/9QM/lXAEaIhvz7hUFnhjiVxPRYjoRpnoaqfZdfZb3dknS78/AS9yfFwpbKwPbVBpcC4G5+NwvPHMN3o0qegXTbTYzmzeavGPB8zfOgyh/90MYIULkshtlLelFGOuZfRk9tiNEukiRhSeSjK8o+AhpTg6umFzkvRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xojd0zZn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ksLSBANC; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBajr1052413
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t4oV7/+gmA3XnnkjBZpQltV40hAmvUYgobOXd8ETLdI=; b=Xojd0zZnacxDUbYP
	jMkgTl2gStxYOeEaavPZCVOUlq5Sm715/1b5KIsOf2oRBmnq9CjI6ihgngXJQy8E
	N+oBEaYT3xo1xnsNK307OHioXjyLMH8/4R4Zmm148oujz/Ar3k9m4bv365/W9ggA
	Te1reYRkHuVqFgjzoZZAde18kYdykxcL9SM0ciCP0jIG6dB2QGINAwLY4rfRMIzx
	jc7A4gXXQTaAqVI2iaGGYo0kNEEWms0hbPdRqAl7o42YnRfX8FJrB4xeKfv55Hdc
	ZskbsT2ReVY4p49BaEsg9djQI+ENG4CYeSvnfEhaLqN8p3Q3nXJN5WgNmNSlnXUo
	CvUP+g==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n44p6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:18:11 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7f582244e9eso106147187b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 05:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782217090; cv=none;
        d=google.com; s=arc-20240605;
        b=hcaJ8gH8UgEXED848sqIXv5JGt62eZxrrD8aQeQjvZTVzZhCunZoguKXzjkUrt36xh
         oXCaEsgWI/TTtqTAlu20jEujoaugIFjbVBOOYt5Ae0Wwzt8al7rGIPCiDFf/pgv++tvW
         HDxSAGKb+a6Y0UKmETMhWRgT7JY1JI584Dhps+3gSWE5IQosoAWdWwV7bQS9E8FrwwiT
         2Bt+eug/kg2EnPXcOfwaKoWkAxSaT/sBdPTwwa3Cx8Cl5wWgr+J4jrn7lxVOeW+51FLO
         t393Z6PxLAJcwhnGkpmpzcKD75VGScf2ua4tXxyKktgzvwTCnPwrpVVVicgkPZ4X/4ou
         N9ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t4oV7/+gmA3XnnkjBZpQltV40hAmvUYgobOXd8ETLdI=;
        fh=4qv3w1QeTJeVO9/zGe9unP4MlcJqvsp7FH7Fc7z+xaQ=;
        b=ZhqyvBiHJmxliMY8eWzREe+yQGHM7s6iEFqLgcfGkt+buFN1XX8aVsVipY5vfZmB0s
         H8TLMEdlXj5ib4/IMtZYR3fnRtrkTcfI9daJKfWTBprnuIRONBHjUroluLGbx47oA2mc
         6DXB9VKh80ratcmgTKQNX0KpWUh/slX/K1BJojCkputYizuCPzKz9iTB4QvC6qt7iBTS
         HiRDvoFL0OujV1BrsUBj6Mr4NEurAC7WmS9NeVLLJD5oC9qkoHXWqIWQ9Pxy+jKwlm96
         uf4uFiUzoLfJRpZDKKNOXuERVww3U2m7iJmjOGMIHv3LBc/TLn1J4G8LSzPNZmrvzMHJ
         MyAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217090; x=1782821890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4oV7/+gmA3XnnkjBZpQltV40hAmvUYgobOXd8ETLdI=;
        b=ksLSBANCAoM90cJdnW6CsLbB4NTzptfxRQxaPJ4UEp0JN+Re4qb0g8WxrzTwicC8g7
         tqKxzyKX3mNR/xxobsPpNoQy7bcZS5K6MqzsT7YpusU7xfMMg8AQYih/kUCsAjxHurvt
         u4DwuIsoMelnF8csrxtmI/TS7K8S079gZUssVvO31zI8JAy21J0s9U+ya3TDwH4u/eGb
         kfdq5qJjsd1RHmh6VJYSJNgy2RVnRcOGf/cq7aM2ZGTdIOWExmzt7u2yb4o4fBYXesNi
         i8n43xvbMCXS04syH51J4xczEmQKvptDPlhgOF3zr4GaM6aUQwpclcSRUHFQTF5SIDtW
         QlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217090; x=1782821890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t4oV7/+gmA3XnnkjBZpQltV40hAmvUYgobOXd8ETLdI=;
        b=PUjdHABG7we13UZnlwajif9zAu4tNI0IWSBfybfJN3bU9j0RYZTIQznEhn13IkigPZ
         Q85lvuzA0WdjD6B6YVsv0U14Tm5aBeERs3zh+GnJUvyU7NgLvumtQiEndt+tsHcsLtca
         VHDKf3DC5YePUGrGCOcKnuPpGS1//TVBj+AqiS7MaCYCFzynMmqRbCgv9VRhfaa1PYHi
         LKOdVPZhuiKZqHbk0FW8nkqq/5AOmj9HiwEWoLzZz+n6aRfaFvwjPDu7PEbBAEeo2qXY
         g1QueWyDYoPlIY338t7xHS6FlQ1oPMvRdtD0GslI79pWcaziPEzxQRgTMWjqP2az2+Py
         u//A==
X-Forwarded-Encrypted: i=1; AHgh+RrqKUsIKD8C803EF70lhIJp/c/UlKCygkCnCWN8/7mtHAW92kRKtYRfH703C9RG2FQH1dxNeu7EUt3Z+jZW@vger.kernel.org
X-Gm-Message-State: AOJu0YzRE1ihwJWt5HAH/WdjGy6Vsz+Jxx98aVXfjiyrksoNd5oX+JQA
	MirvEK6xPlRnCwXU2ELHvanXlqmiUjebYwKPTwaYI43griUySFEwLC6UnONBRXOpB6+xnYAysXi
	qMOFXlKWLyS38fEpXbZVsxI2+jnwPONpMb7VbtO0/1syQUxgkqZUn+IpN8mYJJcK01jogYYL4wJ
	JorNq66abK6R3uY+EG1frnedP2Q/D4dOYZwfVTdzStWYI=
X-Gm-Gg: AfdE7cmtFhpF2icib7d4E0oG2x+c8Ro4sJ9wJs2xKdbhbgnT22veAtMHF3RTCiFC7al
	SHSjmNIvhB4uaz3sNswc7fDEgvjMkhoSClHuORjuh93SK8DW/qo7/P0v0EgPfsk3zN8NVHhx3eV
	s2QVk0Z9Q+xnbUsenF9ZCtLp83psbMa2Mwg3H09Lvcbn7w0e3Y+mIzpVrZlCIvNfIoRMXs
X-Received: by 2002:a05:690c:6d08:b0:7dc:4ba:ee09 with SMTP id 00721157ae682-806c44f1e72mr20371867b3.46.1782217090355;
        Tue, 23 Jun 2026 05:18:10 -0700 (PDT)
X-Received: by 2002:a05:690c:6d08:b0:7dc:4ba:ee09 with SMTP id
 00721157ae682-806c44f1e72mr20371357b3.46.1782217089801; Tue, 23 Jun 2026
 05:18:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com> <69d2e4a7-eb2e-42f2-83e4-0d8ca4b62da8@kernel.org>
In-Reply-To: <69d2e4a7-eb2e-42f2-83e4-0d8ca4b62da8@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:47:57 +0530
X-Gm-Features: AVVi8CeqQCSbxlG2O_pG5LG4Cg5aMh_5wPMj9ibxrDHiq7VDf0Z8G8UW2dxLKrY
Message-ID: <CAC-tS8AEJBbUT8bPRPQTTOmgQgCJLr7pxc+7gPxzGeSBYvRWeg@mail.gmail.com>
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfXzlI+dgmt1Z2u
 XcOllWGFM/4zW36ogT4ZYBz78vAQma7qeZiONuffag0kfIYh2Bmk9LZmZB7rXdYk0m/U1ZwVX84
 FQDkoLC+tkUDscpzyjFxb5l8jzwLDb0=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a7983 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nMCE5c-j9JwJCRtBYlAA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: mEK76S1429UwZvlxoWah0w8wxP6plq4D
X-Proofpoint-GUID: mEK76S1429UwZvlxoWah0w8wxP6plq4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX1rbbzLrSKshz
 20MwxVZpJFBNIpDx8AYeHeCLm7De+XBld9bdWLv60NAzSYs79M5HlmXcbAUEBxRfmjMG2eHHJIf
 J8EQz1YMyQjBeKOFH8lbyxYgOYjmblxS3xCsvAzUvl97sWAE3fPvFmz/k2a2IA39empo7VaUfnO
 itMKt7ghzFISHUSRzW0Gue1HL9m6VBrt3DpmIQ7t8aLCKLRr60+J4blVNYkBJmV2LcQXr+tEYqT
 xIQM2QukAOwT/qFAH/7z13u5LC9wGoN7VTYXbHQ4Ah4vHdt10S6Hm97bXHV5BUJwOp8JHbjZlWK
 2yVJxhk927bX3kNZKGlCIUWO5eYZIOTV/KsO5At+LEPFIVu8zMrMuw6A3+f9rRiMDy/k41fDyOt
 z6SV1r0Wd6Y5k4kxeLg2xgmr/pkEkVsxQ2/L9uQvsjAoZnHQ8ZmuMtq27LeXLLmmKNLB8t/D3Uo
 4qN6RTvxeSwg1syuDBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114200-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C3AA6B7083

On Wed, Jun 17, 2026 at 1:29=E2=80=AFAM Srinivas Kandagatla <srini@kernel.o=
rg> wrote:
>
>
>
> On 6/5/26 11:37 AM, Harendra Gautam wrote:
> > Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DA=
I
> > controller used on the Shikra audio platform.
> >
> > QAIF moves PCM data between system memory and external serial audio
> > interfaces through the AIF path, and between memory and the internal Bo=
lero
> > digital codec through the CIF path. The controller needs a binding so
> > platform Devicetree files can describe its MMIO region, DMA IOMMU strea=
m,
> > clocks, interrupt, DAI cells and per-interface AIF configuration.
> >
> > Describe the single register region, one EE interrupt, the required GCC
> > LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@=
N'
> > child nodes used for static PCM, TDM or MI2S configuration.
> >
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/sound/qcom,qaif.yaml  | 353 ++++++++++++++++++
> >  1 file changed, 353 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif.y=
aml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif.yaml b/D=
ocumentation/devicetree/bindings/sound/qcom,qaif.yaml
>
> Pl run dt-bindings checks before posting.
> > new file mode 100644
> > index 000000000000..5b385e05a650
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,qaif.yaml
> > @@ -0,0 +1,361 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/qcom,qaif.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Audio Interface (QAIF) CPU DAI Controller
> > +
> > +maintainers:
> > +  - Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > +
> > +description:
> > +  |
> > +  The Qualcomm Audio Interface (QAIF) is a fully configurable DMA-base=
d
> > +  audio subsystem controller. It serialises and deserialises PCM audio
> > +  between system memory and external serial audio peripherals (PCM, TD=
M,
> > +  I2S, MI2S) through the AIF path, and transfers parallel audio betwee=
n
> > +  memory and an internal WCD codec through the CIF path.
> > +
> > +  AIF (Audio Interface): up to 13 multi-lane Unified Audio Interfaces,
> > +  each supporting up to 8 independent data lanes. Each lane is individ=
ually
> > +  configurable as TX (output/speaker) or RX (input/mic). All lanes of =
an
> > +  interface share a single bit clock and frame sync. Supported modes a=
re
> > +  PCM (short/long sync), TDM, and MI2S (stereo/mono). Per-interface
> > +  configuration includes sync source (master/slave), sync mode, sync d=
elay,
> > +  sync inversion, slot width (8/16/24/32-bit), sample width, active sl=
ot
> > +  masks (up to 32 slots), bits-per-lane frame size, lane enable/direct=
ion
> > +  masks, loopback, output-enable control, and full-cycle path support =
for
> > +  long chip-to-chip connections.
> > +
> > +  CIF (Codec Interface): up to 32 RDDMA (playback) and 32 WRDMA (captu=
re)
> > +  channels connecting to an internal codec over a parallel bus. Each c=
hannel
> > +  supports active-channel enable mask (up to 16 channels), frame-sync
> > +  selection, frame-sync delay, frame-sync output gating, dynamic clock
> > +  gating, and 16-bit packing/unpacking.
> > +
> > +  Note on RX/TX naming convention: in QAIF, RX refers to the capture p=
ath
> > +  (audio received from the interface into memory) and TX refers to the
> > +  playback path (audio transmitted from memory to the interface). This
> > +  applies to both AIF lane directions and CIF slot/mask properties.
> > +
> > +  DMA engine: RDDMA fetches audio from DDR/TCM/LPM into a shared SRAM
> > +  latency buffer (SHRAM) and drains it to the interface. WRDMA collect=
s
> > +  data from the interface into SHRAM and writes it to memory. Each DMA
> > +  owns a private SHRAM region defined by start address and length regi=
sters.
> > +  Burst sizes of 1/2/4/8/16 beats (64-bit) are supported with up to 4
> > +  outstanding transactions per DMA. Two QSB master ports (QXM0 for TCM=
,
> > +  QXM1 for DDR/LPM) provide the memory interface.
> > +
> > +  Resources are partitioned among up to 5 Execution Engines (EEs) via
> > +  EE map registers. Each EE owns a set of DMAs, audio interfaces, and
> > +  interface groups, and receives its own independent interrupt output.
> > +  The interrupt hierarchy has a two-level structure: a summary registe=
r
> > +  identifies the event class (DMA period, underflow/overflow, error
> > +  response, audio interface underflow/overflow, group done, rate detec=
tor,
> > +  VFR), and per-resource status registers identify the specific channe=
l.
> > +
> > +  Interface grouping (bonding) allows up to 6 groups of audio and code=
c
> > +  interfaces to start synchronously and align their DMA period interru=
pts
> > +  within half a frame duration using the RDDMA padding feature.
> > +
> > +  Two rate detector blocks measure the frequency of incoming frame syn=
c or
> > +  word select signals and generate interrupts on rate change, undetect=
ed
> > +  rate, or sync timeout.
> > +
> > +  Block diagram::
> > +
> > +    System Memory (DDR / LPM / TCM)
> > +    +---------------------------------+
> > +    |  Circular Buffers (ping-pong)   |
> > +    +----------+----------+-----------+
> > +               |          ^
> > +         64-bit AXI  64-bit AXI
> > +               |          |
> > +    +----------v----------+-----------+
> > +    |        QSB Master Ports         |
> > +    |  +----------+  +----------+     |
> > +    |  |   QXM0   |  |   QXM1   |     |
> > +    |  +----+-----+  +-----+----+     |
> > +    +-------|--------------|----------+
> > +            |              |
> > +    +-------v--------------v----------+
> > +    |         Shared RAM (SHRAM)       |
> > +    |  +------------+  +------------+ |
> > +    |  | QXM0 Read  |  | QXM0 Write | |
> > +    |  | SHRAM      |  | SHRAM      | |
> > +    |  +------------+  +------------+ |
> > +    |  +------------+  +------------+ |
> > +    |  | QXM1 Read  |  | QXM1 Write | |
> > +    |  | SHRAM      |  | SHRAM      | |
> > +    |  +------------+  +------------+ |
> > +    +---+--------+--------+-------+---+
> > +        |        |        |       |
> > +    +---v--+  +--v---+ +--v---+ +-v----+
> > +    |RDDMA |  |RDDMA | |WRDMA | |WRDMA |
> > +    | AIF  |  | CIF  | | AIF  | | CIF  |
> > +    |[0..n]|  |[0..n]| |[0..n]| |[0..n]|
> > +    +--+---+  +--+---+ +--+---+ +-+----+
> > +       |         |       ^          ^
> > +       | TX      | TX    | RX       | RX
> > +       v         v       |          |
> > +    +--+--------------------+  +----+----------+
> > +    |  Unified Audio Intf   |  | Codec DMA     |
> > +    |  (AIF 0..12)          |  | Interface     |
> > +    |                       |  | (CIF)         |
> > +    |  AUD_INTFa block:     |  |               |
> > +    |  - Serializer (TX)    |  | RDDMA: DDR -> |
> > +    |  - De-serializer (RX) |  |   internal    |
> > +    |  - Sync gen/detect    |  |   codec       |
> > +    |  - Up to 8 data lanes |  | WRDMA: codec  |
> > +    |  - PCM / TDM / MI2S   |  |   -> DDR      |
> > +    |  - Near Pad Logic     |  | Up to 16 ch   |
> > +    +--+--------------------+  +----+----------+
> > +       |  Lane 0..7 (TX/RX)       |  Parallel bus
> > +       |  Bit clk + Frame sync    |  + Frame sync
> > +       v                          v
> > +    +--+--------+          +------+------+
> > +    | External  |          | Internal    |
> > +    | Serial    |          | Digital     |
> > +    | Peripherals|         | Codec       |
> > +    | (PCM/TDM/ |          | (Bolero/    |
> > +    |  MI2S)    |          |  WCD)       |
> > +    +-----------+          +-------------+
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,shikra-qaif-cpu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 15
> > +    maxItems: 15
> > +
> > +  clock-names:
> > +    items:
> > +      - const: lpass_config_clk
> > +      - const: lpass_core_axim_clk
> > +      - const: aud_dma_clk
> > +      - const: aud_dma_mem_clk
> > +      - const: bus_clk
> > +      - const: aif_if0_ebit_clk
> > +      - const: aif_if0_ibit_clk
> > +      - const: aif_if1_ebit_clk
> > +      - const: aif_if1_ibit_clk
> > +      - const: aif_if2_ebit_clk
> > +      - const: aif_if2_ibit_clk
> > +      - const: aif_if3_ebit_clk
> > +      - const: aif_if3_ibit_clk
> > +      - const: ext_mclka_clk
> > +      - const: ext_mclkb_clk
>
>
> Also do we really need to specify these 15 clocks even though I use only
> one aif interface on my board.
As an example added all supported clock in this binding, in board
specific DT required clocks can be used.
--Harendra
>
> should some of these clocks belong to each aif child node instead of
> global qaif-cpu?
some of these clocks are interface related like aif_if0_ibit, kept in
parent node by taking reference from lpass-cpu driver.
--Harendra
>
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  '#sound-dai-cells':
> > +    const: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  status: true
> > +
> > +patternProperties:
> > +  "^aif-interface@[0-9a-f]+$":
> > +    type: object
> > +    description:
> > +      AIF interface configuration child node. The compatible string
> > +      identifies the serial protocol the interface is wired for on the
> > +      board. The unit address matches the hardware AIF interface index=
.
> > +    properties:
> > +      compatible:
> > +        enum:
> > +          - qcom,qaif-pcm-dai
> > +          - qcom,qaif-tdm-dai
> > +          - qcom,qaif-mi2s-dai
> > +      reg:
> > +        maxItems: 1
> > +        description: |
> > +          Hardware AIF interface index (AUD_INTFa block index). This v=
alue
> > +          also serves as the ALSA DAI ID; it corresponds directly to t=
he
> > +          QAIF_MI2S_TDM_AIFn constants in <dt-bindings/sound/qcom,qaif=
.h>
> > +          (e.g. reg =3D <2> selects QAIF_MI2S_TDM_AIF2).
> > +      qcom,qaif-aif-sync-mode:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
>
> These should be enum instead of uint32, simillar comments apply to some
> of the properties that have only few supported values.
Okay
>
> > +        description:
> > +          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (pulse=
)
> > +          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) sync.
> > +      qcom,qaif-aif-sync-src:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave mode
> > +          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.
> > +      qcom,qaif-aif-invert-sync:
> > +        type: boolean
> > +        description: Invert the frame sync polarity.
> > +      qcom,qaif-aif-sync-delay:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: Number of bit-clock cycles to delay the data rela=
tive to sync.
>
> This looks redundant to qcom,qaif-aif-sync-mode, which already indicates
> the delay information?
SYNC_MODE defines the pulse width/duration (Short/Long/One-slot),
whereas SYNC_DELAY specifies the independent cycle offset for the MSB
data start relative to the sync edge.
>
> > +      qcom,qaif-aif-slot-width-rx:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          RX slot width in bits. This is a board-specific hardware con=
straint
> > +          determined by the wiring of the serial audio interface.
> > +      qcom,qaif-aif-slot-width-tx:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          TX slot width in bits. This is a board-specific hardware con=
straint
> > +          determined by the wiring of the serial audio interface.
> > +      qcom,qaif-aif-slot-en-rx-mask:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Bitmask of active RX slots. Board-specific =E2=80=94 determi=
ned by which
> > +          TDM slots the codec is wired to on this board.
> > +      qcom,qaif-aif-slot-en-tx-mask:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Bitmask of active TX slots. Board-specific =E2=80=94 determi=
ned by which
> > +          TDM slots the codec is wired to on this board.
> > +      qcom,qaif-aif-loopback:
> > +        type: boolean
> > +        description: Enable loopback mode (presence enables loopback).
>
> What is this mode used for, testing ?
this is used to test/validate DMA and interface level loopback with QAIF IP=
.
>
> > +      qcom,qaif-aif-ctrl-data-oe:
> > +        type: boolean
> > +        description: Enable output drive on the control/data line.
>
> will this be ever false?
Yes, as per HPG whenever there is point to point connection this has
to be false.
>
> > +      qcom,qaif-aif-lane-config:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +        description:
> > +          Lane configuration matrix. Each row is a pair <enable direct=
ion>
> > +          for one lane starting from lane 0, up to 8 lanes. Use
> > +          QAIF_AIF_LANE_ENABLE (1) or QAIF_AIF_LANE_DISABLE (0) for en=
able.
> > +          Use QAIF_AIF_LANE_DIR_TX (0) for TX (speaker) or QAIF_AIF_LA=
NE_DIR_RX
> > +          (1) for RX (mic). TX and RX lanes should each be grouped con=
tiguously.
> what do  you mean ? can you elobrate how can you enforce this?
intention to have matrix from DT, where each rows are Lanes and in
each row, col[0] =3D lane enable/disable and col[1]=3Dspkr/mic
>
> > +        maxItems: 8
> > +        items:
> > +          items:
> > +            - description: Lane enable (0 =3D disabled, 1 =3D enabled)
> > +              enum: [0, 1]
> > +            - description: Lane direction (0 =3D TX/speaker, 1 =3D RX/=
mic)
> > +              enum: [0, 1]
> > +      qcom,qaif-aif-full-cycle-en:
> > +        type: boolean
> > +        description: Enable full-cycle sync (effective in sync master =
mode).
> > +      qcom,qaif-aif-bits-per-lane:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Number of slots per lane. The frame length is computed as
>
> bits per lane?
Yes.
>
> > +          slot-width multiplied by bits-per-lane.
> > +    if:
> > +      properties:
> > +        compatible:
> > +          const: qcom,qaif-mi2s-dai
> > +    then:
> > +      description:
> > +        MI2S interface. Sync mode and slot-enable masks are fixed by t=
he
> > +        MI2S protocol and must not be set in DT. Mono/stereo mode is
> > +        determined at runtime from the stream channel count.
> > +      properties:
> > +        qcom,qaif-aif-sync-mode: false
> > +        qcom,qaif-aif-slot-en-rx-mask: false
> > +        qcom,qaif-aif-slot-en-tx-mask: false
> > +    else:
> > +      description:
> > +        PCM or TDM interface. Sync mode and slot-enable masks are
> > +        board-specific and must be provided. Mono mode does not apply.
> > +      required:
> > +        - qcom,qaif-aif-sync-mode
> > +        - qcom,qaif-aif-slot-en-rx-mask
> > +        - qcom,qaif-aif-slot-en-tx-mask
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - iommus
> do we
yes.
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - '#sound-dai-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    /* Shikra platform example */
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/sound/qcom,qaif.h>
> > +    #include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
> > +    #include <dt-bindings/clock/qcom,gcc-shikra.h>
> > +
> > +    qaif_cpu: audio@a000000 {
> > +        compatible =3D "qcom,shikra-qaif-cpu";
> > +        reg =3D <0x0 0x0a000000 0x0 0x20000>;
> > +        iommus =3D <&apps_smmu 0x1c0 0x0>;
> > +        clocks =3D <&gcc GCC_LPASS_CONFIG_CLK>,
> > +                 <&gcc GCC_LPASS_CORE_AXIM_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_MEM_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_BUS_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF0_EBIT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF0_IBIT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF1_EBIT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF1_IBIT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF2_EBIT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF2_IBIT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF3_EBIT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF3_IBIT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_EXT_MCLKA_OUT_CLK>,
> > +                 <&audiocorecc AUDIO_CORE_CC_EXT_MCLKB_OUT_CLK>;
> > +        clock-names =3D "lpass_config_clk",
> > +                      "lpass_core_axim_clk",
> > +                      "aud_dma_clk",
> > +                      "aud_dma_mem_clk",
> > +                      "bus_clk",
> > +                      "aif_if0_ebit_clk",
> > +                      "aif_if0_ibit_clk",
> > +                      "aif_if1_ebit_clk",
> > +                      "aif_if1_ibit_clk",
> > +                      "aif_if2_ebit_clk",
> > +                      "aif_if2_ibit_clk",
> > +                      "aif_if3_ebit_clk",
> > +                      "aif_if3_ibit_clk",
> > +                      "ext_mclka_clk",
> > +                      "ext_mclkb_clk";
> > +        #sound-dai-cells =3D <1>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        interrupts =3D <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
> > +        status =3D "okay";
> > +
> > +        qaif_aif_if2: aif-interface@2 {
> > +            compatible =3D "qcom,qaif-tdm-dai";
> > +            reg =3D <QAIF_MI2S_TDM_AIF2>;
> > +            qcom,qaif-aif-sync-mode =3D <QAIF_AIF_SYNC_MODE_LONG>;
> > +            qcom,qaif-aif-sync-src =3D <QAIF_AIF_SYNC_SRC_MASTER>;
> > +            qcom,qaif-aif-sync-delay =3D <1>;
> > +            qcom,qaif-aif-slot-width-rx =3D <32>;
> > +            qcom,qaif-aif-slot-width-tx =3D <32>;
> > +            qcom,qaif-aif-slot-en-rx-mask =3D <0x3>;
> > +            qcom,qaif-aif-slot-en-tx-mask =3D <0x3>;
> > +            qcom,qaif-aif-ctrl-data-oe;
> > +            /* Lane 0: RX (mic); Lane 1: TX (speaker) */
> > +            qcom,qaif-aif-lane-config =3D <QAIF_AIF_LANE_ENABLE QAIF_A=
IF_LANE_DIR_RX>,
> > +                                        <QAIF_AIF_LANE_ENABLE QAIF_AIF=
_LANE_DIR_TX>;
> > +            /* frame length =3D slot-width (32) * bits-per-lane (2) =
=3D 64 bits */
> > +            qcom,qaif-aif-bits-per-lane =3D <2>;
> > +        };
> > +    };
>

