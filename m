Return-Path: <linux-arm-msm+bounces-110614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDqhLWWYHWoXcgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 16:34:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32705620EF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 16:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A788130AE572
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 14:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC7C3BB668;
	Mon,  1 Jun 2026 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYSeQywf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKFXRqJm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D343BB67F
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 14:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324068; cv=pass; b=I1k7rHaTIJWU+jDZivyoO3c2efVKLEGQd78kjJqZP/qYgPoP004ASOihxIoHZUElrsMw3nvUoTCzZSQD6pmeta450EZRznwyiVe85Mu/0kbTkXMy/UNS+2t3OAe/hjvOaqqapZQq+zeFh7koHELs5mLndsKbK8aVblyIoiVnRq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324068; c=relaxed/simple;
	bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9F8Gwa70fghXS1TRnP1gsxFQC273senrmBvy+DE6kUerSR97u4jb9v0iviDWHAcS/gn9g/hHNPnKQPT8dvGZKzZkuzuiMZr2hjrRA4sZGr8YzLtCs2te2GQbIKitvp21Raq2m3vmxU61Du1p1UBtx5st+LKM9/arSESUpYyAAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYSeQywf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKFXRqJm; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518f92m2740436
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 14:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=; b=eYSeQywf7FMxqrQk
	od7fVL+a15CjGgOjdKZ9JrJ6YgjM8H3b2KIHu1wZdwESi2mpqdqdk0gEILmxUiHd
	z7cILavNamfurl9wlRFX4dJL7LgBTviAm3kNOZa8ZsZNKq6RmiTRn466q+SngTqF
	MKkap1nUOcXGSGemv+DzXT+Bet7+QpfuoovnXJmrziUq3MPPtbOP587h5B7hJ09g
	w2R4AMcxbr/duIUgGGpmFUBxyAM+pcfI5jDVqBE584F72S/9lAbrV0FpLLF7+8Ix
	W6m3+2XO84Cydmp6MgZg4CdmVCBeXCk20G87YdSUah+HAZSPz3t5QClstxpP5fzO
	O/GUJQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqhd82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 14:27:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9156ae53566so102262785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 07:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780324065; cv=none;
        d=google.com; s=arc-20240605;
        b=MvgUDen3Wzz00Ll85DSy5qj9Ks34vk7W5U5HpKVqxArOJ26cIFRPAm4CbyXc9ffKLz
         tLQxUnYxze+MFgcRVH9nZzMISKTJg1o+BJDMylKmXSqMMr30Q1gonE66qIohsS6pUGYK
         VgA4KHAKAml3ZpqJ/6h72+M/ZKh1Ha7SthKfxmBLSn3O+UXG3qMpYEavr/4ShTCD2qq3
         lJ5WqNLc/SEz/RQWspnFlEOB2DfGMHaH83Ps17pH8dygZ6drwpxKXjOjgovIw9so2y+S
         htoNFE7Pn6igP/hmUaenuE8ZNeVKlc67CZahZvvIPE0oJxTEXlE5HjSIFSD2TvYLtIcR
         5WdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
        fh=hrOOcNRHyn7sll5KhtCD0s4JcejPRIXj67WKhA8Jn2U=;
        b=PRDuLATyQZYN8T+k2rxv0B2CU3eCco/rba9HgDFlZpZ10AsWg8XwCys29e/AnI2QBk
         S3R6vNIGNF4dQZfF2MO49jIL/uP3SnPdqcsT7ERtES8ukIYMWvJ/LzL2HPo1KnJIdVKC
         BLTVa4yUWVy6QLKRPeoTrgFtwI2UmVRDWQG+2foUG3VHqN78ZjxOzTQZqsYXMj2gJGLJ
         /hC4X5sPS98Tg9YaDQEd0DDgjV1UFyoAxdget3b1YkzWf1GRZEkUHEBUe05/gcUvCLx4
         bVN8M6MKn5Qsz69D4Oj5oy2R7Qa6SKq8fCwzVJOyFcrfrzX5XTWexdN8+UAsKHAL+WBE
         Xxuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780324065; x=1780928865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
        b=ZKFXRqJmBAgulbKGv/wfOvm/maOrMwM5ZsLytEhBL3KmJheLaHVfxANoL2gajheQoN
         /J13EibTMuOnY3eUnsuEfBlPSdSV1RxBzNmGTGR3NLyegByMwywSfiL3FKDqdqeuTg8C
         UjLTvMArxtHbY2OZUoQIut/vZk+pedCwq5++fBgKaAN3x0Xevp+ed6ljzAX7FZiQ9CU3
         ISbQMFZZLfOepM2Ln2zuwbW9K/Gdltfj1u0UgHqOc1Av2wKswalFHvI0ZbA8c/V5g5Lo
         LivHI1DF19JnjWNAOq0IbeJ6DBA3vbHz1ul7nxM4yOh1VuWjSgBk8O2aZ1lXQQPeReQb
         lExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324065; x=1780928865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
        b=TDZbPe1hzkoq/D2kwsmaYxkRIS8hKhyVpaB4WHTqx8uPM9FFyU/8WraXaDm/dOocF4
         Z8iLwi4CYGbGky8iWQ2vokizOvAkd6JAOUZZgFtwJbRgYio1lK9hzE8Hmo/CW2kje8qY
         IRNi0jwESTc2rtRGAXX07VJ7jzZHCnh4In+8TynP6oAaPiWd+TAiC7muDEIoVZr//Cle
         ROZBrBD7oEpvWhJ4RPiQdV+IKSaKEHaI7UMQGGnRqzC0JJTIH+lM4zNQE3yz+8XRU9IH
         VDooZd2O3YRhUMTgPr4sYURfliHfOk6XgauwL/LiGKRo8H2FntI3IpHRmEsUp54Xfu3h
         Ul+g==
X-Forwarded-Encrypted: i=1; AFNElJ95LjAVqwPt5cGTyT/R8oSegq2ElmCmR2zQU9mw5cYkHeouKKRlsn4Z8M8M8teMq72b8G02TxVNu9kTaD7U@vger.kernel.org
X-Gm-Message-State: AOJu0YzVgBaNC8+EIH3AYfeTGoF/zrSDsrciagRaXsuul0EsaXpEzL0V
	KO3eYDJtWo8OAvZ8qzsGATuOMdh+cBjGPOhcfLrQnWjwVHX3v8S7SvYS07i8of1XYN40RSw7/5C
	OH2EtJ5qm9JFXRPIVh7a2lH6APaIMXFMnDt9IeWpW0mFb6sIbnY+dTSJvLKXMJOa1we7a652axT
	SajT6H7MC/Rh8aAvnrKg0J1bk1Z1JdPQLeiZa2ZPxt9F4=
X-Gm-Gg: Acq92OEhY/Lrf60M/HfyLEeDBDKXpXJ8J5kuvhL03Rdx0VY/HflTwKc7Vu+2vTukv5P
	+CcTgAV/maYgiCOGHvpMyoQl4uKBC7topjJqkCmWE9EEsUHYINL+tDoRbNsODqDDc3ZjNDqgY1x
	uiQuBcwq3naZrrfhUe0mCP2dfhdUNLRINuQXS5IRNPimrXlkhIMP54rL68POlBHFa68sYuIQnRw
	GqD6AxqkyfwBjyhGPBNX0qmGcf07/KPwcGRYneayL2vcw==
X-Received: by 2002:a05:620a:231a:20b0:914:e3dd:17e8 with SMTP id af79cd13be357-9153d938aa6mr1215098685a.8.1780324065138;
        Mon, 01 Jun 2026 07:27:45 -0700 (PDT)
X-Received: by 2002:a05:620a:231a:20b0:914:e3dd:17e8 with SMTP id
 af79cd13be357-9153d938aa6mr1215093485a.8.1780324064677; Mon, 01 Jun 2026
 07:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4> <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
 <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org> <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
 <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
In-Reply-To: <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 16:27:31 +0200
X-Gm-Features: AVHnY4LtL5VPWicujYWGAL868BWzmKvPSaREWLjiMCcMMmubijXxiTOJv64_r_I
Message-ID: <CAFEp6-3prh88NTK5U1HAARmQr203LVcbW4hoo_zuK4Qof4BAzg@mail.gmail.com>
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: VeqJ48QHjHzHNSgi6xa5i8sN62w9nwKy
X-Proofpoint-GUID: VeqJ48QHjHzHNSgi6xa5i8sN62w9nwKy
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1d96e2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=6RP30FUjIQ2jcUxmk7IA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE0NCBTYWx0ZWRfXwgubXRZehrNc
 492BWB5hpFiAqjhRPsGQ8uORegnAWpIVCtlUuEMUZZskZKmsFEdxTezl2xeVMcFZBT3NqPTRnbB
 7utO6XJuC07lb8F14W6mTPW9fzGlo6lJrIgTvL2xrqQSDBihX9PPYP5IKMtfeD7rZwYwln8YrC0
 /6KgBMvUH93yEMedsUYwBvMC4tu9ZnrRmrBZ0GU0b2aO9D4dyMfh7M1zF2zwmdUBG0f0kL9IxAL
 7/fzwC0vlRTLJ4YFbfUrreaRJbtpK3vhQE7KbHTWA2FziUitd+ci6ihRDxa/DtU/XeEgLLVO8xC
 452GqlmFbSNlxpcHAkOk+c7WziOOvg9/Uk6dhrqTZ/UuJ3NJVkXMjYo+RKkV7KpYBe6U/VEnIkB
 2/RbWZo3rQp355dVyC+G5BFUDiJm5EPoSjX8NU0rgZhANZgjWuYv5Nqz9QCtD6XQIAxe/hiO3Eb
 7A0xYpQwEFfCQF6wmjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010144
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110614-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 32705620EF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 1, 2026 at 4:15=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 01/06/2026 07:42, Nihal Kumar Gupta wrote:
> > Here is the full IOMMU SID list for both platforms:
> > Agatti (QCM2290):
> > - 0x0400 0x00 =E2=80=94 VFE non-protected
> > - 0x0800 0x00 =E2=80=94 CDM non-protected
> > - 0x0820 0x00 =E2=80=94 OPE read non-protected
> > - 0x0840 0x00 =E2=80=94 OPE write non-protected
> >
> > Shikra:
> > - 0x0400 0x00 =E2=80=94 VFE non-protected
> > - 0x0600 0x00 =E2=80=94 CDM non-protected
> > - 0x0620 0x00 =E2=80=94 OPE read non-protected
> > - 0x0640 0x00 =E2=80=94 OPE write non-protected
>
> What this tells me is that the Agatti binding is incorrect for addition
> of OPE as a separate device.
>
> > Only VFE SID (0x0400) is shared between the two platforms.
>
> Both platforms have the same IOMMU list, its just that you are
> correcting a bug in Agatti's defintion.

Yes, Agatti is declaring too much if we want to go the camss multi-node way=
.

>
> Again only IFE SIDs should be included in CAMSS...
>
> > The current Shikra submission enumerates only the VFE SID.
>
> Great, this is what we want.
>
> I think for future submissions we need to be commenting, naming,
> something each IOMMU entry as we have a problem now in Agatti and a
> legacy problem - already - in VIDC as a result of misallocated IOMMU
> entries.
> > Should CDM and OPE each get a separate YAML binding like [1], or
> > should both be part of the CAMSS YAML binding? If part of CAMSS,
> > please confirm and we will add their SIDs in the DTS in the next revisi=
on.
> > [1]https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9-
> > bb1055274603@oss.qualcomm.com/
>
> Yes I think CDM should be a standalone block and BTW use standard DMA
> APIs with its own IOMMU entry.

Interesting, so CDM should be a dedicated subnode as well, and not
part of the OPE?
Then, If we want to use it from OPE at some point we would need some
'cdm' phandle in OPE node.

Regards,
Loic

