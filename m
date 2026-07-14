Return-Path: <linux-arm-msm+bounces-119076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E0rlKAxvVmq+5QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:17:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B248757445
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:17:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Cbu0B/vd";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jdQWlkAS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119076-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119076-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C51A3051144
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE35C3321AA;
	Tue, 14 Jul 2026 17:16:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6332848BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:16:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049413; cv=none; b=cIkUz2wxAxgW8c7ZcHGqdD8AtMxDuxLcJQc6/YSr6wU3hSWUMK/SQufHoYT6NsicsYapRFSxqODRX3ShEG6geShdEZY/PHbmC3FeTAe32xRompl/iHqxTPh1+UGmZ2Z26vLi35oo7HIlGqgyNtaJuTuYh5UACVJzegKc0iAG1l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049413; c=relaxed/simple;
	bh=eTPWOkDZU7NSNet6LTEv4XpPhcoO3XmX/dnYsB4Wz40=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uVPqJK4TjIqgjkw2reI3bQuuHPM6LmOfpEiliIn6kjnhAegtKldo19J4ntsy+XnRo4C95SSkcbcEbhTzeyg4VZFEQibSfUaM6j8vxbDpDJyJwRLhlyUTlAA3LEn4CxxU2jvo3/w/2cRs3S+iZQcJiC6is6dWGSNJZIjXy1f0QP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cbu0B/vd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdQWlkAS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG79v31091427
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ueEdPXcCYs2ajqwTAsWlOc
	MnEPkIxdB2B/rM8xuRBIE=; b=Cbu0B/vdSFxyPSV+W3yRYn5jQxuH3rdkIcm3UN
	s7Trfl0paqyDq1OSo/SVX9smdnD0D0vs32Cj2fMEEIhwPJCUPZ5iNLIKHs4qd0+b
	aNTAfVWWMmlkfPPcHyQCi+GLMKDao1c/0g+fxzGfoDGsaOVE5V0UdMp+ZiCHcGXW
	saN4beOXtvR733k8EhZirqgSsQq2FZ6Xq3OUbFx9sgOGfwUz5FyW2p0/PRAciMik
	gKT1gu7T5vPti2u2TXnLr26A5keZqpnSsStFkpyVtAO2GI25StHEAEiR0Zani+tO
	65hzdDKBLXKJcAGLlNtG+wsliLTawILrxW2g7mBVB4semnYQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgudjamq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:16:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so11358085a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 10:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049409; x=1784654209; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ueEdPXcCYs2ajqwTAsWlOcMnEPkIxdB2B/rM8xuRBIE=;
        b=jdQWlkASYFXrKqSYTg9bNwCSVRXDaLttv4QmjPA6Ak7Svl8R68Slr3pje15TpfSXXW
         z6M9PePvpqEVPnyM2Zj5keIpLEr487Xjkz2Utc/JfsKcwlnKjKzcLgNnVsNXMHO41qS/
         UCZ+KMa+Hz0AKHJdrkBxHVPqlPc8q+mUsC27P88uSSi/APbCVkJfqeVFH4R3zCrHrjOO
         DFm2aocWXJfDsolwWXT2CrTyn+iGXSd2aN8nu8PKOmrZiqEZ0fudXCfhr/lAspHVpKJ5
         vfIFamzoI91sSW7jaHRHy37HVDuGbulsu3TKeozzM7PYtkS1J3xI2RsOR7UQt8mnEaK/
         mzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049409; x=1784654209;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ueEdPXcCYs2ajqwTAsWlOcMnEPkIxdB2B/rM8xuRBIE=;
        b=OXKd5+X6owRo9YVEwqc/kLDg3UdLS4y4lxYo2OHJRIv94DVmS5yo5zieA6B6Ef1505
         vqC4WsnaMDHWu65m68vAwhsS0p/uVjX7AmCMAcxhlZtcj8RX9+U3bQY2HO5lE2ow75Yi
         ZdOgKUiCEigjUY9KPQCJ/U9gACa6hfH5fj7IY+AJ4lJO/Yy2Qm+nl+Q93/6M7Vw279zF
         toAmhRbrzfkgEpoOxlez/hfyBvL742Mxrc3o/D+yWtBRNCOCyEEUmTz7Tf8RHT21IdEp
         LRT+UfhJOfDPqgu3yQyXrKXsoA9WPgD8/JMePY9i15+Tf7kwid8e8tguzPEVdRBTZ6MF
         JbAw==
X-Forwarded-Encrypted: i=1; AHgh+RpO7ctngQPdrk5P/sj4lQpmN2E1n8eEjhdaZw+S3dToMwL4151r9FtukyS1FRZ1dGpXwfTuGqZHvfHo1lrG@vger.kernel.org
X-Gm-Message-State: AOJu0YwH3a7VpQmGqvjuosK3P9el0uhIsjEzpLP47MIXdVamhjoW9QOG
	ubwPsajA+SpcaRLXWj7RckNjasgwhJQqS/YtmubX9RXAY6+vjK1tUW0Hxv5W9nmxp6+So1eld6o
	f0G5HE2I/v6OnhxbrUq2Z4L1S5qEEMTb8+J8tX/8L37xge5B5CZ42pGTih7nxlNJUvqg0
X-Gm-Gg: AfdE7ckeKIc6Lq4g6oIxUvvFOQ34h8CPHr687MV0UFpLsmVqnatKgSHiYAhiJczanWU
	JjhWw0/DAAEaFtjzyL/9KEozpv40TY1O7bfECTaxzUD9SPBLD3HKuatJDRqWxpZEpse26eB0wye
	WUCOcPnpgzWXAkM9GRV77ezBf+J4Bf7jzH7h+wSTM1UxBhA3gurnTxo/wva3EesZny0wNYp8ECp
	yJVrV/wyqgPNENVfg4xm7Qh+zcBG7WrDiUFu/taoVbJrixEPm+36NtpiroL8VqULo1gMSFhzLH4
	EM3pALuycU+1GqSG9WZJovG1BOgKQMzrCNjQ1YqHbAXX9fjReZ7ryaQ4rUhe7bV5ijzgS25vIio
	vwkVGvQ+S7JSMmDIfNqs+3ZNaIbLzZXIJozvsDOu43uLrnPw=
X-Received: by 2002:a05:6a00:21d6:b0:847:8496:1aa2 with SMTP id d2e1a72fcca58-84a557e5bffmr3187966b3a.27.1784049409055;
        Tue, 14 Jul 2026 10:16:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:21d6:b0:847:8496:1aa2 with SMTP id d2e1a72fcca58-84a557e5bffmr3187938b3a.27.1784049408420;
        Tue, 14 Jul 2026 10:16:48 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:16:48 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: [PATCH v23 00/13] Implement PSCI reboot mode driver for PSCI
 resets
Date: Tue, 14 Jul 2026 22:46:28 +0530
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOxuVmoC/53UzWocMQwA4FcJc+4EW7JHck55j1KKf+RkoLuTj
 LdLQ9h3r2cpmYXG4PZisMGfZCH5fSiyzlKGh7v3YZXzXOblWDeAX+6G+OyPTzLOqR4MoMAqUm7
 062F8KXEey1s5yeH7KkVOMJ7lmJZ1XCUsy6mMZoqslDE+xzxU62WVPP+6Bvr6re6f53Ja1rdr3
 LNW2/GfEFp1hqjXRjUKkUFixGTi41LK/etP/yMuh8N9XbbI/6UGSBiYIQjbv9XtAWetb5Ombl5
 XPmUUCKAZI7Z4uOFBd/NQeabgI0o0ANLi8Zbvzx4rPwVOgKgtO27xZudZ227eVB4pgcvW+eh8i
 7c77wC6eVt5ioJeMRNn3eKnD16rf8h+2jrHsZfkPaA0a087r7snql6rvJlEsQ3RmxhbPO88AHb
 zvNUesndCk+R2Y7pbnrt5tw1rCM5OyqJqdg58/AWTQmV6edimNmZKaGp7IkGL1ztv+vserlMbs
 0MiskKt4gDsvNX92W9TC+xtSKLI8Gf85XL5DTLdV7KuBQAA
X-Change-ID: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=16388;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=eTPWOkDZU7NSNet6LTEv4XpPhcoO3XmX/dnYsB4Wz40=;
 b=bjkPdlUhC00oyoJebsCFHCsivPcWXCj0WT77E+YVopHi8NBHYZsTI28zYrg671HhBCyrCUAc7
 E7ott4PMxOmDKrNixd2JHpaH1PE/LDLbeyp2r8YgzDZpv78KphApSVI
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: xcrceKxzUXfm5uPRYaDbjL-pzqcxnNqZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX6NQTkardA7RH
 uKxWiGYmY17cBLDxT6q9EF1SURR+kqX74H6e3mRUShzPYbXnx5GztIZPl7q4g7Ma3yPDlFbc9Tx
 DI2FYJPnvJC8XBXaZynuIBhZ5Fc5tWeXcjoO5YBB8bedAUul92/rTg6HDf+tOMA8sdeCoQv9Znq
 V+PaOe4x6foSma8DRKAyg+cAjaM6FfeO9PgWNHAbl8MPdMJbAlNfe0dWBbfnCATnS3iJXICGQL8
 B9IPDk6jTDenDsVotg9TriCyukK4uM+7US32jYDiUGIs2mDQ9ZpnSVQAHvq9cYVeHre4ld2SqF8
 /qpa4BOPk0U1GN9y/QOkgYQtUaGEgiaQ2xmympaUTYrtganaSsyUWFUiai4JA0A1Eb6gcmI19IF
 RDOI1eN1woMNYbSX+k0RwtfbKlQCvfUwbw3TD/CRIaMBBdv250LjWCso7NVDE7CgkC8Vs+n3plj
 IVEGuZiXUOuoBe/veRA==
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a566f02 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=7CQSdrXTAAAA:8 a=s8YR1HE3AAAA:8 a=pGLkceISAAAA:8 a=etiEgX_XAAAA:8
 a=Q-fNiiVtAAAA:8 a=ag1SF4gXAAAA:8 a=JfrnYn6hAAAA:8 a=N3Fm1xduiZLYDfhQGJcA:9
 a=5CJ2f-K-Skongk47:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=jGH_LyMDp9YhSvY-UuyI:22 a=MLbIUA-Bjd6y1alW9qBG:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX3WgCx3wbauY9
 dJBuXmRzfWGBaR563OeVUhk+GjProgaVOwU8iitqJMiyHheNpLs6CyT/xO/xMsRfLULwvvIMWAy
 nxPz/J5aw+0raS1SsVw39aLsUigplY8=
X-Proofpoint-ORIG-GUID: xcrceKxzUXfm5uPRYaDbjL-pzqcxnNqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119076-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:brgl@kernel.org,m:sudeep.holla@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:shivendra.pratap@oss.qualcomm.com,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mfd@lists.linux.dev,m:srini@kernel.org,m:sebastian.reichel@collabora.com,m:bartosz.gol
 aszewski@oss.qualcomm.com,m:quic_songxue@quicinc.com,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B248757445

Userspace should be able to initiate device reboots using the various
PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
patch series introduces psci-reboot-mode driver that will induce
command-based resets to psci driver for executing the device reset.

The PSCI system reset calls takes two arguments: reset_type and cookie.
It defines predefined reset types, such as warm and cold reset, and
vendor-specific reset types which are SoC vendor specific. To support
these requirements, the reboot-mode framework is enhanced in two key
ways:
1. 64-bit magic support: Extend reboot-mode to handle two 32-bit
arguments (reset_type and cookie) by encoding them into a single 64-bit
magic value.
2. Predefined modes: Add support for predefined reboot modes in the
framework.

With these enhancements, the patch series enables:
 - Arch Warm reset and system reset cold as predefined reboot modes.
 - Vendor-specific resets, configurable via the SoC-specific device tree.

Together, these changes allow userspace to trigger all above PSCI resets
from userspace.

Note on introducing PSCI-MFD:
In v19/20, psci-reboot-mode was implemented as a faux-device. Review
discussion suggested this may not be the best model for firmware-backed
consumers, and that representing PSCI users as regular platform devices
would be better. One suggestion was to add a PSCI-MFD driver, allowing
multiple consumers tied to a single PSCI node "arm,psci-1.0" be probed
as MFD cells.

Following this, the series adds a PSCI-MFD driver and introduces
cpuidle-psci-domain and psci-reboot-mode as child cells. To meet the
psci-reboot-mode requirement, the MFD core is extended to support
fwnode.
Reference discussions on this:
https://lore.kernel.org/all/20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com/

---
The patch is tested on rb3Gen2, lemans-ride, lemans-evk, monaco-ride,
qcs615-ride.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Changes in v23:
mfd: core: Add firmware-node support to MFD cells
 - Add named_fwnode-based firmware node support in MFD cells.(by Bart)
 - Update the release path. (by Bart)
 - Add checks for duplicate fwnodes.
 - Update documentation for usage and limitations.
mfd: psci-mfd: Add psci-reboot-mode child cell
 - Update for a named_fwnode-based reboot-mode child cell. (By Bart)
 - Split psci-reboot-mode and psci-cpuidle-domain into separate child
   cells.
power: reset: Add psci-reboot-mode driver
 - Add COMPILE_TEST in Kconfig. (by Bart)
 - Update to support up to three u32 arguments to accommodate a
   32-bit reset_type and a 64-bit cookie. (By Sashiko, Lorenzo)
dt-bindings: arm: Document reboot mode magic
 - Update to support up to three u32 arguments to accommodate a
   32-bit reset_type and a 64-bit cookie.
 - Dropped reviewed by from Bart and Rob due to considerable changes. 
firmware: psci: Introduce command-based resets
 - Update to support a 64-bit cookie. (By Sashiko, Lorenzo)
 - Update the flow so unsupported reset commands and any failures during
   reset command execution fall back to the
   Linux reboot_mode path. (By Sashiko)
power: reset: reboot-mode: Add support for predefined reboot modes
 - Handle errors and free lists in devm_reboot_mode_register(). (by Sashiko)
 - Update to support up to three u32 arguments.
power: reset: reboot-mode: Support up to 3 magic values per mode
 - Patch for 64 bit magic renamed.
 - Update to support up to three u32 arguments to accommodate a 32-bit
   reset_type and a 64-bit cookie.
 - Dropped reviewed by from Bart and Sebastian due to considerable changes.
- Link to v22: https://lore.kernel.org/r/20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com

Changes in v22:
By Bart:
  power: reset: reboot-mode: Add support for predefined reboot modes
  - Add reboot-mode helper to add predefined modes.
  - Add centralized init for reboot-mode.
  - Dropping Reviewed-by from Bartosz as changes may need a review.
  power: reset: Add psci-reboot-mode driver
  - Use reboot-mode helpers to initialize reboot-mode driver and add
    predefined modes.
  mfd: core: Add firmware-node support to MFD cells
  - Use callback function to get fwnode from a MFD child cell.
  mfd: psci-mfd: Add psci-reboot-mode child cell
  - Use callback function to return fwnode for reboot-mode.
By Pankaj:
  mfd: psci-mfd: Add PSCI MFD driver for cpuidle-psci-domain cell
  - Make MFD_PSCI defaults to y as ARM_PSCI_CPUIDLE_DOMAIN defaults to
    y and depends on it.
- Link to v21: https://lore.kernel.org/r/20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com

Changes in v21:
By Krzysztof
 power: reset: reboot-mode: Remove devres based allocations
  - remove fixes tag.
By Lorenzo
  firmware: psci: Introduce command-based resets
  - psci_set_reset_cmd() only takes reset_type/cookie as input params.
    - updated this as a encoded u64 reset_command - from Pavan Kondeti.
  - Update commit text for reason for explicit panic_handling.
  - Clean split of reset flow in psci_sys_reset via handle_reboot_mode and handle_cmd_reset.
  - Add psci_has_system_reset2_support() helper and PSCI reset-type defines.
By Lorenzo/Bart
 power: reset: Add psci-reboot-mode driver
  By Bart
   - Drop faux-device based probe.
   - Convert driver to platform-driver model (probed via PSCI MFD).
  By Lorenzo:
   - Use PSCI-specific predefined reset mode naming/magic.
   - Register arch-warm predefined mode only when SYSTEM_RESET2 is supported.
   - psci_reboot_mode_write to directly pass reset_type and cokie.
   - Add MAINTAINERS entry for drivers/power/reset/psci-reboot-mode.c.
By Bart
 mfd: psci-mfd: Introduce psci mfd driver for cpuidle-psci-domain cell
  - Introduce psci-mfd driver.
 mfd: Add psci-reboot-mode cell via fwnode
 - Register psci-reboot-mode from psci-mfd with reboot-mode child node
   fwnode.
 - Update reset Kconfig dependency to tie PSCI reboot-mode to MFD PSCI path.
For alignment:
 - mfd: core: Add firmware-node support to MFD cells
   - Add firmware-node support to MFD cells.
By Pavan
 power: reset: reboot-mode: Add support for predefined reboot modes
  - Move redundant logic of adding modes to list to a common function.
By Arnd
 - Remove refrences for Linux reboot-modes from code and commit text.
By Konrad
 - Updated all dt changes to add reboot-mode for supported board files.
- Link to v20: https://lore.kernel.org/r/20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com

Changes in v20:
By Bart:
 power: reset: Add psci-reboot-mode driver
 - Check for psci compatible in init arm,psci-1.0
 - Node pointer should not be assigned in device probe.
   To Align on above:
   - Remove probe call for faux device.
   - Set node using device_set_node after faux_device_create.
   - Register the reboot mode using explicit call to psci_reboot_mode_register_device.
 - Updated in-code documentation.
For Alignment to use of device_property_xx:
 power: reset: reboot-mode: Add support for 64 bit magic
  - Use device_property_count_u32 instead of device_property_read_u32.
  - Check count of properties before reading.
  - u64 magic changed to u32 magic[2].
  - nvmem-reboot rebased on recent changes.
  - Update documentation and commit text.
power: reset: reboot-mode: Remove devres based allocations
 By Dmitry/Bart:
  - pr_err to pr_debug in case of invalid reboot-mode prop.
 By Bart:
  - Use device_property_read_u32 instead of of_property_read_u32.
  - Avoid repeated code for free list. Now calling unregister from
    error path of regiister_reboot_mode.
 - Fix magic assignment.
- Link to v19: https://lore.kernel.org/r/20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com

Changes in v19:
- Add missing To/Cc entries (include devicetree list) – Thanks to
  Krzysztof for pointing this out.
- Fix compilation error in reboot-mode.c for ARCH=powerpc by explicitly
  including <linux/slab.h>.
- Link to v18: https://lore.kernel.org/r/20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com

Changes in v18:
 power: reset: reboot-mode: Remove devres based allocations
 - Update commit text for alignment. – Bart
 - Read magic before assigning kzalloc(info) in reboot_mode_register. - Mukesh
 - Update error handling path. - Mukesh
By Bjorn
 - Expose sysfs for reboot-mode bisected to different series-
   Link: https://lore.kernel.org/all/20251222-next-15nov_expose_sysfs-v21-0-244614135fd8@oss.qualcomm.com/
By Bjorn/Lorenzo/Mukesh
  power: reset: reboot-mode: Add support for 64 bit magic
  - Use FIELD_GET/FIELD_PREP for u64 magic wherever required.
  - Update commit text and add documentation for structure of 64 bit magic.
By Lorenzo
 - Remove direct reboot-mode registration by psci driver.
 - Add support for predefined reboot modes in reboot-mode framework.
 - Add psci-reboot-mode driver and implement a psci-resets to accommodate
   all psci-resets including warm, cold and customizable vendor-resets.
By Bjorn
 - Update DT patches for qcm6490, lemans, monaco and tolos.
  - Update commit text to include more details – By Bjorn
For Alignment
 - dt-bindings: arm: Document reboot mode magic
   - Update reboot mode documentation to clarify that argument1 should provide
     full value of reset_type along with the 31st bit wherever required.
 - DT patches for qcm6490, lemans, monaco and tolos.
   - Provide full value of reset_type including 31st bit.(eg:0x80000001).
- Link to v17: https://lore.kernel.org/r/20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com

Previous versions:
- Link to v16: https://lore.kernel.org/r/20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com
- Link to v15: https://lore.kernel.org/r/20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com
- Link to v14: https://lore.kernel.org/r/20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com
- Link to v13: https://lore.kernel.org/r/20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com
- Link to v12: https://lore.kernel.org/r/20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com
- Link to v11: https://lore.kernel.org/r/20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com
- Link to v10: https://lore.kernel.org/all/569f154d-c714-1714-b898-83a42a38771c@oss.qualcomm.com/
- Link to v9: https://lore.kernel.org/all/20250303-arm-psci-system_reset2-vendor-reboots-v9-0-b2cf4a20feda@oss.qualcomm.com/
- Link to v8: https://lore.kernel.org/r/20241107-arm-psci-system_reset2-vendor-reboots-v8-0-e8715fa65cb5@quicinc.com
- Link to v7: https://lore.kernel.org/r/20241028-arm-psci-system_reset2-vendor-reboots-v7-0-a4c40b0ebc54@quicinc.com
- Link to v6: https://lore.kernel.org/r/20241018-arm-psci-system_reset2-vendor-reboots-v6-0-50cbe88b0a24@quicinc.com
- Link to v5: https://lore.kernel.org/r/20240617-arm-psci-system_reset2-vendor-reboots-v5-0-086950f650c8@quicinc.com
- Link to v4: https://lore.kernel.org/r/20240611-arm-psci-system_reset2-vendor-reboots-v4-0-98f55aa74ae8@quicinc.com
- Link to v3: https://lore.kernel.org/r/20240515-arm-psci-system_reset2-vendor-reboots-v3-0-16dd4f9c0ab4@quicinc.com
- Link to v2: https://lore.kernel.org/r/20240414-arm-psci-system_reset2-vendor-reboots-v2-0-da9a055a648f@quicinc.com
- Link to v1: https://lore.kernel.org/r/20231117-arm-psci-system_reset2-vendor-reboots-v1-0-03c4612153e2@quicinc.com
- Link to RFC: https://lore.kernel.org/r/20231030-arm-psci-system_reset2-vendor-reboots-v1-0-dcdd63352ad1@quicinc.com

To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
To: Souvik Chakravarty <Souvik.Chakravarty@arm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Andy Yan <andy.yan@rock-chips.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: John Stultz <john.stultz@linaro.org>
To: Moritz Fischer <moritz.fischer@ettus.com>
To: Rafael J. Wysocki <rafael@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
To: Christian Loehle <christian.loehle@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
To: Lee Jones <lee@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Andre Draszik <andre.draszik@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: mfd@lists.linux.dev

---
Shivendra Pratap (13):
      power: reset: reboot-mode: Remove devres based allocations
      power: reset: reboot-mode: Support up to 3 magic values per mode
      power: reset: reboot-mode: Add support for predefined reboot modes
      firmware: psci: Introduce command-based resets
      mfd: psci-mfd: Add PSCI MFD driver for cpuidle-psci-domain cell
      dt-bindings: arm: Document reboot mode magic
      power: reset: Add psci-reboot-mode driver
      mfd: core: Add firmware-node support to MFD cells
      mfd: psci-mfd: Add psci-reboot-mode child cell
      arm64: dts: qcom: Add psci reboot-modes for kodiak boards
      arm64: dts: qcom: Add psci reboot-modes for lemans boards
      arm64: dts: qcom: Add psci reboot-modes for monaco boards
      arm64: dts: qcom: Add psci reboot-modes for talos boards

 Documentation/devicetree/bindings/arm/psci.yaml  |  54 ++++++
 MAINTAINERS                                      |   2 +
 arch/arm64/boot/dts/qcom/kodiak.dtsi             |   2 +-
 arch/arm64/boot/dts/qcom/lemans-evk.dts          |   7 +
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi |   7 +
 arch/arm64/boot/dts/qcom/lemans.dtsi             |   2 +-
 arch/arm64/boot/dts/qcom/monaco-evk.dts          |   7 +
 arch/arm64/boot/dts/qcom/monaco.dtsi             |   2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts         |   7 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts         |   7 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts     |   7 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts        |   7 +
 arch/arm64/boot/dts/qcom/talos.dtsi              |   2 +-
 drivers/cpuidle/Kconfig.arm                      |   1 +
 drivers/cpuidle/cpuidle-psci-domain.c            |   9 +-
 drivers/firmware/psci/psci.c                     | 106 +++++++++++-
 drivers/mfd/Kconfig                              |  12 ++
 drivers/mfd/Makefile                             |   2 +
 drivers/mfd/mfd-core.c                           | 142 ++++++++++++---
 drivers/mfd/psci-mfd.c                           |  71 ++++++++
 drivers/power/reset/Kconfig                      |  10 ++
 drivers/power/reset/Makefile                     |   1 +
 drivers/power/reset/nvmem-reboot-mode.c          |  14 +-
 drivers/power/reset/psci-reboot-mode.c           |  78 +++++++++
 drivers/power/reset/qcom-pon.c                   |  12 +-
 drivers/power/reset/reboot-mode.c                | 211 +++++++++++++++++++----
 drivers/power/reset/syscon-reboot-mode.c         |  12 +-
 include/linux/mfd/core.h                         |  10 ++
 include/linux/psci.h                             |  36 ++++
 include/linux/reboot-mode.h                      |  20 ++-
 30 files changed, 770 insertions(+), 90 deletions(-)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20250709-arm-psci-system_reset2-vendor-reboots-46c80044afcf

Best regards,
--  
Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>


