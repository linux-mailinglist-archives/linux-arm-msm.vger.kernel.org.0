Return-Path: <linux-arm-msm+bounces-112080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4K2KJpjbJ2r53QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:23:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BD065E498
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:23:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UiZHzBLy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W+hm+IDZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112080-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112080-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C15E9301AA5D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1083ED3D1;
	Tue,  9 Jun 2026 09:17:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBFD3AC0FA
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:16:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996622; cv=pass; b=pvoqHnUfg1ZxRbExMSKzi23RPyupePAyoV7pV7hV/SZoXwHz5SMsioFojJlg2FPEiiPHkIPhuNjmQB71m71PIRv/tiRtaP/o3f0pfOOfrVRZ1dQklOEbwR1Psh0s9U4/xdz8xW8gP3ULTFOxqKBZTBZ6Nbg+Atjg7ZhOykqTObw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996622; c=relaxed/simple;
	bh=TaJIKM3O2Do2Nt4kIaUSWB8jEWE1Qwyap2u8PR62hB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJX0X5pmE0qsaH7WJ8TAEJZ/NN+wBWfj9fD2j7WdoW62Vr3csatAcOtzcbKTIvHZbRafYLu6KlMeiB/JGjEal2XKQH8aFzjdNBGvPKslb0dZ1kU527tH9WPYwHUjIIw6iG/1XXQMVwwp8IesoTZdtnvCyQYT3lGV0WaVT+JRHhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UiZHzBLy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+hm+IDZ; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rQhY1517718
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=; b=UiZHzBLy4QyYM2Ks
	N5cm8P4GmceWbdMF1milaB0NUBQ8s4AgwRDCssevYujEjrAkBVTA4jO923lz9Wl2
	mHZLwHJZ9r9GTahp9dh4aqaIUTEyNiNYXD/1BiR1nRpKEwItt8gi/hY2+yWnGwp3
	kyDaQuGvCbrGquG6a87/sKd7qD3wBldP0Xf+ZCbT2dZOzOl26cLaMs2Glnpoa4KU
	CO8NGAjzC7sA+NRQxoXibKITV7Gj1Lunrh4O3pzo71nKvSo42DeUxG3zmdSyIc4A
	zWGSKMrq3mauzlsp5t4fkd9M8ITdZMiMRsQiJz8sP+KKviNRtBfXyj7JamLklmbc
	CSh/XA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr8cqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:16:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157f1be083so1069731885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780996617; cv=none;
        d=google.com; s=arc-20240605;
        b=Bji29Yz4n4G8XAT7O4XAqxXCSaAl6NJkx25NmqzKbJKkEHiRsomZrl+7maQ4PgmNwV
         QjWbCRKh6JEUvUEiFbmVzjujCrUGnHzRVPoBpXJpQj4rJWw4iB2NeVELReIJOlt0yUMl
         x/Ai8IOcsHE+66xxoyI6FOA+k4i+SewmXo7H47TRuQGS00IzT1rE4PiHx8Pp6kir5MaN
         pu56gz1gQfh79yNSUTmVTn5tUTSpFVV2S/8/XPVB1lp/ThZ9d1cmNCYYNjXByzL0skD/
         S+vpKQNIDO1UXcFFCYoe78tgJGjA4BmJ9xcXawH1/qVkxs6XB7m20h30POh6GVFD/0Pj
         rIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=;
        fh=Xne1Y7rHzPfjn93oAlxU2bXrTXlmhl+NWy71bHg8Rt8=;
        b=X/X9U8Dx+gaZw5gA/Ja2skIankOruDBxpkkmulwcqO+qNmr+t8I5R+nmmiam+PbEV/
         iXZTL1NI90YnFw9ZTI3XBync5bxEK/Waaf/NrQQ0gdtWN9xt6/I5N+vwQi9NWDjrBJx6
         1b1BUiSOZ9Ah81sOOpRn0kiDwYma/0JunOyCOSV0w+zzTqBT6WUDOzZaGFwEbn3z31Zi
         U03cU66mkLGQA9je5HPL8FRlpBKMxe3ULSPFZVC5xj8/tCWauJxk8ME5SfZxYQmvL6ie
         H8GcYIW0jrtcx8u3BvySAW8ocllIxCC4xqyjefRYL5WhoskJEBbPJ6RKYBvFMBF6f6bb
         BMWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996617; x=1781601417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=;
        b=W+hm+IDZ+Te5QTlrcziMBKSHf0e+rSuwESM2TsPwcG2Z/KWKoFe84O02WEfYNwE2QM
         lxSgrnyOvn6+ZntqK5prUNlgMqBUHW5HamuVM2BMRB5+mXdzCLJCdY0aDXWm/Zbt3yjQ
         WG2IkRDXpHQuwVxwVYaVMI49M+cjRKGN7iQjqDzR5pTe4tdzAWJcfkD7SsHGRDL43VsE
         ErNsvW9ASPvqok0dDq5hvZKlNR63uvxyTs4yMCGajpOkfK9T9IqkiveErn0LSLgbmmZS
         8Xx1eYm2dyvJVNOGw3JCsSTIUwOSAudGTiH+xoiQ2FqXIpEXfDYbc5OIPMmQtZatDue3
         HBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996617; x=1781601417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EqyMxiE/m94G4SRX6R7mDsxcjVfUYvMbEvBF14uWFo=;
        b=guYXtaJyNylKF0SsQLibzbHwFLvYbDIVo9CQyKhvI/JRwjwQYR2SdmaFoqj/t7m5cj
         drgSRDJ+fy0ZYFNdZuRDr5q/HJvMjkjvb53MZ4qBGXn60Mf8IbrtomuyNJF+FhHPQkI9
         A84lDZEV7DFy1jAgYMUO3Yk9b0aVmcPbElXgWb423D2tKi76NvZWqucMXJNx6x6QCQsq
         lLSmlhTalB9s2zCaFUQ7UBnxLzn5mAIOocOsRWkC/BDhb+ope7D45vqTJMvHqAWVL7/+
         zI1qQVKlPzUJIvAXHTL42+ASGg5vKuQ25S0cElRrIH9ZnBAYA8vH9kQA/KUNebT8u1ff
         AASw==
X-Forwarded-Encrypted: i=1; AFNElJ9htfI55Q8N7xRSSKZGL32NDdHvXHzLVE4MYHPBDn0pDFEcgA4D5Ldvsq3PC8Rv8+HAsHiLwsk0vnH1B9TH@vger.kernel.org
X-Gm-Message-State: AOJu0YxpdRRLAtmYMoAzaZsxYQjG90y3zFscIXJqnjWLKHAst5uH35Xp
	mkieApB9fKAjutjkCTaH7mrqTFHOvMeOpOirb2kk/ZUh9bpPTqMjWOMC+PV1Shptz9UARSRK0Pw
	9pHjoxFDIjCfwFvN5OHAgLRR+AKvpTKJqeZW68MkfBpRItJnJuC662UJfA0YyrNQ8Apwm4yU4rK
	yR4RXr+2S8KPu7G5zdBmwra5BEz9I5yf34buPL9PaZBFg=
X-Gm-Gg: Acq92OFvOa+dHmYG1HVbd/juslMylmUMAr+t/Cic2b4csWBoNNfGXPfRr5Wf3yvqnQJ
	iGC8o22RhERKGCztZIXUGP2MeOgFAeaAWYfWVQlvSMjvNaM9bp2QciLZgMgrcvgv9iMe7Ci645P
	pJ+VZj9irY4G6UoqNDjhuh/R3EHoU1bx8DRWpjld2l3BKnle7AwtkphXk+dinc66Z6Erxv2SBDC
	EMEKn5st1IJNSP3h3DKdeM6LtO9kORG0EAoLeOmAiScGETTbu+Kt40/Oh47V678CrIwcworgOO1
	IQO8rQrLaIJrzn0EmP5u9LvxhLKSHY7xYMKAzCiwD033W10ESfDGXBuL1zRJ
X-Received: by 2002:a05:620a:1a0a:b0:915:40ff:4e10 with SMTP id af79cd13be357-915e822bf5amr252716785a.4.1780996617393;
        Tue, 09 Jun 2026 02:16:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0a:b0:915:40ff:4e10 with SMTP id
 af79cd13be357-915e822bf5amr252712085a.4.1780996616898; Tue, 09 Jun 2026
 02:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com> <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:16:44 +0200
X-Gm-Features: AVVi8CcruF8G3bHCMvT-UUyCre6c8b-WOyhsQAf9gtMqJA6eGNVQ_TK2SNIM-_k
Message-ID: <CAFEp6-2V_srCT=wWFb5Pjrhq2-pzTG5QCd90Pf+0s92qC6G8LQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: i2c: qcom-cci: Document Shikra compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 78DbESll8rhBRAU6DKIzTdYD8EUGpGY2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NSBTYWx0ZWRfX1PnRAPqAPdQ+
 mQb+Ghg3peHAotf2LCV2kFiMaCsNBDPJ/0gMyJ0vDyXEBw0idregKut6sGv+F66eJWYacyfy5BI
 zUOeexPSsQUPpRsT2Q+9ABVSB3hoM7n8LzVlFTTMGmF4POeru4iy/+AbeR6lYNyeuZ0jSK5GzlA
 p8JIxepM8nAi/kRMj1bQiuKqHDWoOkxCjJxbDEhSvdLPDoyBGZa7PKZyiHgmSoAfjw9sYu9hdN4
 S6QWpWVtP4jBDlpME+RWsehy+lGD04C3ZrMj7KGbypcYOcWtiks89Rn0IIVqQVJMerDy8ZYwfOH
 VL7oXGwjIKI9WG3nLbSfB8rhApBKTJEOOz/ir6ImVBD5CoN0NsJv6RW0ucaTeOH8xjcIZjT0wwJ
 cRbeoPbJll5qmEBiVszHzQlyI6NnVqi6nn7Max9dVsuf7TOitttuSZ+OM651M8bblTyyV+927B+
 E/x29DtCV7i+3+kzfuQ==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a27da0a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=LDBv8-xUAAAA:8 a=KKAkSRfTAAAA:8
 a=b40KZWPJp5KrgtGOUacA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=DZeXCJrVpAJBw65Qk4Ds:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 78DbESll8rhBRAU6DKIzTdYD8EUGpGY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112080-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nihal.gupta@oss.qualcomm.com,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:wsa+renesas@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com,oss.qualcomm.com,sang-engineering.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,sang-engineering.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3BD065E498

On Mon, Jun 8, 2026 at 4:07=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Add Shikra compatible consistent with CAMSS CCI interfaces.
> It requires only two clocks.
>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 7c497a358e1dc8cec8b31c17bfedf315e4e00606..c94069afd8d06dbb08ddd6b49=
e2de7dc7acdc29a 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -35,6 +35,7 @@ properties:
>                - qcom,sc8280xp-cci
>                - qcom,sdm670-cci
>                - qcom,sdm845-cci
> +              - qcom,shikra-cci
>                - qcom,sm6150-cci
>                - qcom,sm6350-cci
>                - qcom,sm8250-cci
> @@ -137,6 +138,7 @@ allOf:
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
>                - qcom,qcs8300-cci
> +              - qcom,shikra-cci
>                - qcom,sm8750-cci
>      then:
>        properties:
>
> --
> 2.34.1
>

