Return-Path: <linux-arm-msm+bounces-91604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIfCMGiVgWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:27:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 069E0D537A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 883CB3029AEA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 06:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1612F3793A5;
	Tue,  3 Feb 2026 06:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tg+mii1B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i/nVEaNU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F636378D9D
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 06:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770099965; cv=pass; b=js8dLNrbcgNiLQ6mRFVbdDqf5sIcDhPx/7qhgEdNnqqKv4yQXwIAk9kf80ETY5rX431Y7QoehW0LAA7D/8BO6U5eLL8eROM94I/PyfcoODLAYVSwPgmSgXJqmRAoi6T1s3rLntDoqcMCLUC8yY6sqg0PXMQCuptCvGPIXChDcd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770099965; c=relaxed/simple;
	bh=oCphwJkdZe6LRMAUacVTeTswL+Mn6s2RohyxBsl0Bz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FaNXdF1kjeC2zTCIf3466V7aG7LgUHHRp1KZa5R7wKJvOH5tKaJIyuvlcBKreT3ttjQU3TRVts5p2mTLM74ivY97ykdby0jdW9cIFbYu6iIV8E3fz8YuAydOgS7Er7w4deyczFFHZ8r2OekrPAF3uWz9Flvugq3dKiJ9hLu+upI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tg+mii1B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i/nVEaNU; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612MU49D255010
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 06:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxOArcS/K+FXiz9EXMccDCt6XWeHK0YJMoVPhvlmBjM=; b=Tg+mii1BA3LKeit7
	5b0Ca4bGk13ukT+a7jMmZDb3Mh/6cLHfqVbbgNeVhkftJCXf1xApawDyaZTGFfnz
	WDf8HfJtq2AbrOAw6jXgZVEmkQE4GRNKGBvbj5gR/cL3KiccJXrscvQspMpKLQyz
	m73sAxUotw2qsvsD1cK9RplHRblGyWiupR/Qw/mP2qxp1xmSQnH8kyB7J9ageB9N
	QWTQ17hZPBQXNCNUU0ILJwDRogBcGDYNrjtpl7e5npksTVU6s2VaIUQ9ga2A8KQc
	JVU86UHoD2YzSxZCq9OXjeTlW7DNryfAWoDKOLO27VYOvyMVGfgHhgaFNxLflERy
	PQq7AA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0kjxa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 06:26:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89462dd72a6so186231196d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 22:26:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770099961; cv=none;
        d=google.com; s=arc-20240605;
        b=iTnXutnUZESO9dTy/1jIJ6NlZEZyKO8INXD6fr48YC+gN9uIHCRY/VCMMiHwIH2aQh
         UGwAA/58LhQMAFrHCYhw4UHWbHh8Jo3ZxOez2KC4GZZCDhtsk54NVWyogmHgx9a3PZM1
         nQdJT4au1995kgDTNShvy8cggc9mNk5+Vjx9hIFgqZBkz6SupwFJlkE1lgDDO+CL3NnL
         /N/MwCxAY53XZYUWh7XA7DLQOWEweH4wWDIFTcic7G3bTkJGulXCdPGgr4QKJ4qrjh3T
         1jYJFD0/WgPL1gi3faLD8vwacpIeVFeApvOmby2Mr7QScSEAEQ1dp1TjBiAq7ShoWyMV
         n1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lxOArcS/K+FXiz9EXMccDCt6XWeHK0YJMoVPhvlmBjM=;
        fh=/pcU1siSK6SR3+qtUyXVQv4/Y1KzSX78iaUv4OA3Hds=;
        b=KpgBd0VGWpMNwbNm0eNAzcqy1V00hTyHZqaqvm2MLcY7sagF9iJ0j6fQ3DSxiv2l4y
         CSxB2D3YKyY7zhdU39hBCuFibjKmY+Br4At5LNcl9OLgmMNirf6D7m/LHFqrtP2MrvfZ
         qTUMrq7W0TvPcrj6ZRyDGrcX4KwvgdVmgww1eul0VfMf13Wy53v5/hcmcx+0cP4hG2zK
         3Pdk6KlPK5gAjyCYiksr6q7+r8ZjBwnEUb7RmTwgJkUBW6nszeuqOEo0mmcY7XtbprV2
         vLBv2NW2Xxuo3lMRCSwBrw1MyUaztopXGj120R45dprZZekvXMemw7whWbhrMRZSFEUH
         7XBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770099961; x=1770704761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxOArcS/K+FXiz9EXMccDCt6XWeHK0YJMoVPhvlmBjM=;
        b=i/nVEaNUIXrp1cqOngI0drmcrCqMOZQzUfAdWp38i98KfZcZBy+q9GkdTaXp6ItDFt
         RXFFrGz4Nt1bwCH2vOJYoFHHFkSRAMLdVYz+YmisHoSbZspLjvy+wAAKgbT3jgdrwNOD
         Llt1PLshUU1mH8QMh+ZVDNRomW6yK/BcWA1IlVfgApSPxLZ29/1MV/rWAFaxNdICbSs9
         2o5DPEmug0CYwq74UmuN7+aMlk73IcYpG3uyLyjS4iYQAEYFheJHs1HK37FX8Ks5V2c1
         AuEF4JzxMF4iGJFdOq+GKCnw78bh+/d72txtX+G2g7rcPtukRga3vh8xLXfaivPgQ8rj
         lFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770099961; x=1770704761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lxOArcS/K+FXiz9EXMccDCt6XWeHK0YJMoVPhvlmBjM=;
        b=cfQC/DsDF8opDcbTfNFeedvrfdSlt3n1zWNFjtavwY7u8072QM5wO9lTAXQJjrSwCZ
         jhsmW9zTb0jeVXklqDmCTeOd5rNUcVaLnrAYrFTbWZQE7b5IPlYn5gJhosdiWvPxle4z
         jUnKqaWV77UnXsWzBnnTFFmrXclco9+5nlcmOtaBPA14XT9VJFJqg/h4T3O+8a8P2mnA
         tHDqZET6QsQmQpv87AvMBE2KvDagr9+RFUkLNzcV5UJHP10gTzozroUJMT7efJTsP3xW
         fz6RxJsOxgXWZ4l2eSQbm2OsAiJ1S6sw3MSp6/wl+XLgeScVkOTeOvVUQrItsAVQq3yK
         uegA==
X-Forwarded-Encrypted: i=1; AJvYcCXspELMRLrBzZtWTOW6Q6DZXh7lKz+EvMPCuREp/+fHHQk3y5+xW5V8VY7UM9A8vwiOH5IzmKVXY1AQHPZp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9D6vDp8RXxV/qRucGZQxCW+EYg5/Blzs2PvNJM1zMI5Cg/MeE
	h97vdCJzPKCtvFQEEHU4tEPBVA3CVknUm8FE3yBzKnQODGhUrFLIA22aZDSLWSMot4++1ix4Gjb
	IlXzDRB+Rvjq+2Ok26ep1Xayah5LPmj+COlTwvTTeNH3cl0FeDc/UmioQukCcEI53yHDRR2ZhhF
	ZYIPlTWcUqRBzuU2y1i2Bduq1IlcbVrFL+8/Rf+N1G5PE=
X-Gm-Gg: AZuq6aIVCp9WLh7dBYwDNRaJeWObL+Cl06a//oPxVhp4e3PXugVP4bb1aE4aCPXzsAh
	i4b1verxqzkeb+M6MEujArlQTJucnmP6cpRZjoTQlfI84fShRMR2fCtTOx+uSmc26e0TojHgku+
	fqIUjqntTS6QxLoiyqNuQstARo7mKPzqoZT29eC6Bg9N/6xmyz55ogGLNcx6T9M3mJANwY
X-Received: by 2002:ad4:5aa2:0:b0:894:5989:7f7f with SMTP id 6a1803df08f44-894e9f22938mr204179586d6.2.1770099961449;
        Mon, 02 Feb 2026 22:26:01 -0800 (PST)
X-Received: by 2002:ad4:5aa2:0:b0:894:5989:7f7f with SMTP id
 6a1803df08f44-894e9f22938mr204179376d6.2.1770099960916; Mon, 02 Feb 2026
 22:26:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
 <20260122092852.887624-5-swati.agarwal@oss.qualcomm.com> <63fjxtcmpbpna4cuuis332y3p52b6pvh43gyg6m7u5kiwkb2pb@znwfyet4xlpc>
 <CAHz4bYuR_LZXh=tS2FJ4VE9tVB6vN10pd-9i=uOL35sSx_BRzg@mail.gmail.com>
In-Reply-To: <CAHz4bYuR_LZXh=tS2FJ4VE9tVB6vN10pd-9i=uOL35sSx_BRzg@mail.gmail.com>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 11:55:49 +0530
X-Gm-Features: AZwV_Qi8kR_1ge01bIMHozVG-yFMgRlA2x3kGTlJscY_-zygtxRaWP7jyvUm7ZI
Message-ID: <CAHz4bYtX42FxSG6p+1K4JS3gQGiJDxduMvpghECch5j3Wcoj1g@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: lemans-evk: Enable secondary USB
 controller in host mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Reqdyltv c=1 sm=1 tr=0 ts=698194fa cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=-HxOJJ4HDTbh8BZd8EEA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA1MCBTYWx0ZWRfX8h9a9W3Hjnx9
 BEQXbXMX/O7ISgeAcNnkx2RR1bHpbeHNMuK+ME8+g5076aNPLYspKmKPV8SC1skbr9vncNdBtcD
 pHG1Xqq1QKdJqdOFndq7oOqfBE1iX1XV3r6go4AJls37TQohgfBKxUBmXyFPCheyrdoq7+ajMVU
 XXvTwRmo4yHLI5FKqOYEvimaCRjhe7iSdNxl7oC6S5z+YqwSdVmLMnxK/pclqsYMO3ALByp5r8e
 6TVLfArClUrUzoUZ5JaccUJfw+wY1oEiSRnXuP9AeHzV8GXD/hWO699sgqMVyad2zpxmikUC4nB
 wIbAtABA9IvZ2pvXH6VQgaAgHO/rdTc0fJwc4WuYSNsIqGWYchlqwaTuqrlWDXVlpqGGEG4ex8u
 VBC/VbDNnPzcwep54epZbAP8VkUluztbSL7aCWCkBghs8Hnu681G+fRdjfg9hlQvV4IdrdCnr20
 l6KM1U6+407LBDkPMTA==
X-Proofpoint-GUID: dXBp6Bg2reblHOunGYnvro6y9XEP32MK
X-Proofpoint-ORIG-GUID: dXBp6Bg2reblHOunGYnvro6y9XEP32MK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91604-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email,0.0.0.47:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.2:email,0.0.0.0:email,mail.gmail.com:mid,0.0.0.1:email,0.0.0.4:email]
X-Rspamd-Queue-Id: 069E0D537A
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:53=E2=80=AFAM Swati Agarwal
<swati.agarwal@oss.qualcomm.com> wrote:
>
> On Thu, Jan 22, 2026 at 4:02=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Thu, Jan 22, 2026 at 02:58:52PM +0530, Swati Agarwal wrote:
> > > Enable secondary USB controller in host mode on lemans EVK Platform.
> > >
> > > Secondary USB controller is connected to a Genesys Logic USB HUB GL35=
90
> > > having 4 ports. The ports of hub that are present on lemans EVK stand=
alone
> > > board are used as follows:-
> > > 1) port-1 is connected to HD3SS3220 Type-C port controller.
> > > 2) port-4 is used for the M.2 E key on corekit. Standard core kit use=
s UART
> > > for Bluetooth. This port is to be used only if user optionally replac=
es the
> > > WiFi card with the NFA765 chip which uses USB for Bluetooth.
> > >
> > > Remaining 2 ports will become functional when the interface plus mezz=
anine
> > > board is stacked on top of corekit:
> > >
> > > 3) port-2 is connected to another hub which is present on the mezz th=
rough
> > > which 4 type-A ports are connected.
> > > 4) port-3 is used for the M.2 B key for a 5G card when the mezz is
> > > connected.
> > >
> > > Mark the second USB controller as host only capable and add the HD3SS=
3220
> > > Type-C port controller along with Type-c connector for controlling vb=
us
> > > supply.
> > >
> > > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 208 ++++++++++++++++++++++=
++
> > >  1 file changed, 208 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boo=
t/dts/qcom/lemans-evk.dts
> > > index 074a1edd0334..a549f7fe53a1 100644
> > > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > @@ -68,6 +68,45 @@ usb0_con_ss_ep: endpoint {
> > >               };
> > >       };
> > >
> > > +     connector-1 {
> > > +             compatible =3D "usb-c-connector";
> > > +             label =3D "USB1-Type-C";
> > > +             data-role =3D "host";
> > > +             power-role =3D "source";
> > > +
> > > +             vbus-supply =3D <&vbus_supply_regulator_1>;
> > > +
> > > +             ports {
> > > +                     #address-cells =3D <1>;
> > > +                     #size-cells =3D <0>;
> > > +
> > > +                     port@0 {
> > > +                             reg =3D <0>;
> > > +
> > > +                             usb1_con_ss_ep: endpoint {
> >
> > This contradicts USB-C connector bindings. Why?
> >
> > > +                                     remote-endpoint =3D <&hd3ss3220=
_1_in_ep>;
> > > +                             };
> > > +                     };
> > > +
> > > +                     port@1 {
> > > +                             reg =3D <1>;
> > > +
> > > +                             usb1_hs_in: endpoint {
> > > +                                     remote-endpoint =3D <&usb_hub_2=
_1>;
> > > +                             };
> > > +
> > > +                     };
> > > +
> > > +                     port@2 {
> > > +                             reg =3D <2>;
> > > +
> > > +                             usb1_ss_in: endpoint {
> >
> > port@2 is for the SBU signals. It can't be connected to the hub.
> >
> > > +                                     remote-endpoint =3D <&usb_hub_3=
_1>;
> > > +                             };
> > > +                     };
> > > +             };
> > > +     };
> > > +
> > >       edp0-connector {
> > >               compatible =3D "dp-connector";
> > >               label =3D "EDP0";
> > > @@ -141,6 +180,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0=
 {
> > >               enable-active-high;
> > >       };
> > >
> > > +     vbus_supply_regulator_1: regulator-vbus-supply-1 {
> > > +             compatible =3D "regulator-fixed";
> > > +             regulator-name =3D "vbus_supply_1";
> > > +             gpio =3D <&expander1 3 GPIO_ACTIVE_HIGH>;
> > > +             regulator-min-microvolt =3D <5000000>;
> > > +             regulator-max-microvolt =3D <5000000>;
> > > +             regulator-boot-on;
> > > +             enable-active-high;
> > > +     };
> > > +
> > >       vmmc_sdc: regulator-vmmc-sdc {
> > >               compatible =3D "regulator-fixed";
> > >
> > > @@ -536,6 +585,39 @@ hd3ss3220_0_out_ep: endpoint {
> > >                       };
> > >               };
> > >       };
> > > +
> > > +     usb-typec@47 {
> > > +             compatible =3D "ti,hd3ss3220";
> > > +             reg =3D <0x47>;
> > > +
> > > +             interrupts-extended =3D <&pmm8654au_2_gpios 6 IRQ_TYPE_=
EDGE_FALLING>;
> > > +
> > > +             id-gpios =3D <&tlmm 51 GPIO_ACTIVE_HIGH>;
> > > +
> > > +             pinctrl-0 =3D <&usb1_id>, <&usb1_intr>;
> > > +             pinctrl-names =3D "default";
> > > +
> > > +             ports {
> > > +                     #address-cells =3D <1>;
> > > +                     #size-cells =3D <0>;
> > > +
> > > +                     port@0 {
> > > +                             reg =3D <0>;
> > > +
> > > +                             hd3ss3220_1_in_ep: endpoint {
> > > +                                     remote-endpoint =3D <&usb1_con_=
ss_ep>;
> > > +                             };
> > > +                     };
> > > +
> > > +                     port@1 {
> > > +                             reg =3D <1>;
> > > +
> > > +                             hd3ss3220_1_out_ep: endpoint {
> > > +                             };
> >
> > Why is this port disconnected? It it really N/C?
>
> Hi Dmitry,
>
> Sorry for the confusion, Can we do it as follows:
>
> hub:                    Hd3ss3220   typec-connector
>
> usb_hub_2_1 <-> port@1       port@1 <-> empty
> usb_hub_3_1 <-> port@2       port@2 <-> <empty>
>                              port@0 <-> port@0
>
> Regards,
> Swati

Hi Dmitry,

Gentle ping.
Let me know if the above remote endpoint connections look good to go.

Regards,
Swati


> >
> > > +                     };
> > > +             };
> > > +     };
> > > +
> > >  };
> > >
> > >  &i2c18 {
> > > @@ -699,6 +781,14 @@ usb0_intr_state: usb0-intr-state {
> > >               bias-pull-up;
> > >               power-source =3D <0>;
> > >       };
> > > +
> > > +     usb1_intr: usb1-intr-state {
> > > +             pins =3D "gpio6";
> > > +             function =3D "normal";
> > > +             input-enable;
> > > +             bias-pull-up;
> > > +             power-source =3D <0>;
> > > +     };
> > >  };
> > >
> > >  &qup_i2c19_default {
> > > @@ -868,6 +958,12 @@ usb_id: usb-id-state {
> > >               function =3D "gpio";
> > >               bias-pull-up;
> > >       };
> > > +
> > > +     usb1_id: usb1-id-state {
> > > +             pins =3D "gpio51";
> > > +             function =3D "gpio";
> > > +             bias-pull-up;
> > > +     };
> > >  };
> > >
> > >  &uart10 {
> > > @@ -922,6 +1018,118 @@ &usb_0_qmpphy {
> > >       status =3D "okay";
> > >  };
> > >
> > > +&usb_1 {
> > > +     dr_mode =3D "host";
> > > +
> > > +     #address-cells =3D <1>;
> > > +     #size-cells =3D <0>;
> > > +
> > > +     status =3D "okay";
> > > +
> > > +     usb_hub_2_x: hub@1 {
> > > +             compatible =3D "usb5e3,610";
> > > +             reg =3D <1>;
> > > +
> > > +             peer-hub =3D <&usb_hub_3_x>;
> > > +
> > > +             ports {
> > > +                     #address-cells =3D <1>;
> > > +                     #size-cells =3D <0>;
> > > +
> > > +                     port@1 {
> > > +                             reg =3D <1>;
> > > +
> > > +                             usb_hub_2_1: endpoint {
> > > +                                     remote-endpoint =3D <&usb1_hs_i=
n>;
> > > +                             };
> > > +                     };
> > > +
> > > +                     /*
> > > +                      * Port-2 and port-3 are not connected to anyth=
ing on corekit.
> >
> > I thought that they are routed to the HS connectors. Are they not?
> >
> > > +                      */
> > > +                     port@2 {
> > > +                             reg =3D <2>;
> > > +
> > > +                             usb_hub_2_2: endpoint {
> > > +                             };
> > > +                     };
> > > +
> > > +                     port@3 {
> > > +                             reg =3D <3>;
> > > +
> > > +                             usb_hub_2_3: endpoint {
> > > +                             };
> > > +                     };
> > > +
> > > +                     /*
> > > +                      * Port-4 is connected to M.2 E key connector o=
n corekit.
> > > +                      */
> > > +                     port@4 {
> > > +                             reg =3D <4>;
> > > +
> > > +                             usb_hub_2_4: endpoint {
> > > +                             };
> > > +                     };
> > > +             };
> > > +     };
> > > +
> > > +     usb_hub_3_x: hub@2 {
> > > +             compatible =3D "usb5e3,625";
> > > +             reg =3D <2>;
> > > +
> > > +             peer-hub =3D <&usb_hub_2_x>;
> > > +
> > > +             ports {
> > > +                     #address-cells =3D <1>;
> > > +                     #size-cells =3D <0>;
> > > +
> > > +                     port@1 {
> > > +                             reg =3D <1>;
> > > +
> > > +                             usb_hub_3_1: endpoint {
> > > +                                     remote-endpoint =3D <&usb1_ss_i=
n>;
> > > +                             };
> > > +                     };
> > > +
> > > +                     port@2 {
> > > +                             reg =3D <2>;
> > > +
> > > +                             usb_hub_3_2: endpoint {
> > > +                             };
> > > +                     };
> > > +
> > > +                     port@3 {
> > > +                             reg =3D <3>;
> > > +
> > > +                             usb_hub_3_3: endpoint {
> > > +                             };
> > > +                     };
> > > +
> > > +                     port@4 {
> > > +                             reg =3D <4>;
> > > +
> > > +                             usb_hub_3_4: endpoint {
> > > +                             };
> > > +                     };
> > > +             };
> > > +     };
> > > +};
> > > +
> > > +&usb_1_hsphy {
> > > +     vdda-pll-supply =3D <&vreg_l7a>;
> > > +     vdda18-supply =3D <&vreg_l6c>;
> > > +     vdda33-supply =3D <&vreg_l9a>;
> > > +
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&usb_1_qmpphy {
> > > +     vdda-phy-supply =3D <&vreg_l1c>;
> > > +     vdda-pll-supply =3D <&vreg_l7a>;
> > > +
> > > +     status =3D "okay";
> > > +};
> > > +
> > >  &xo_board_clk {
> > >       clock-frequency =3D <38400000>;
> > >  };
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

