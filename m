Return-Path: <linux-arm-msm+bounces-113098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MSEwBHGmL2pPEAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:14:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C90B68417E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:14:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Iemi6Q5S;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VE6nVr2Z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113098-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113098-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 832A63034BD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000973BB685;
	Mon, 15 Jun 2026 07:12:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7AF3BB9F4
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:12:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507577; cv=none; b=tNYmZNaVva/Qlb59OOguBDwCp0v3ZjWRdxSsUqR3WXfNXIC825hrV6UKdxjbA11VQjd0ZFxqpJUEKuV51dN4OJefebfiW0soJLZHe3JtX9Yyo1WtxPVXz8g30rz8ogZnH3D0CewTf5upVP6/6GGq7MwVu4pLn5+Vd7L2YisJFRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507577; c=relaxed/simple;
	bh=FD/YYzeYflttpFETR8KNzzuysuLGEKsTDke9rdJBgPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d64UV6wWIkTVvBbDPnUE/jqdq1ourxIlGhOvc3eQ26YiRpORp7TSl1f3tKqZ+NorkfnpUQh8a8jnSTMaedEtRHVJHzQIFF3BanYiUe2BZtzgRS7TVikQeZmB1SRk9qtMAA1MSOhQpa2jJIeCTANGX6f/mvPuqtol32bUSzZh/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iemi6Q5S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VE6nVr2Z; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6Kbqk3910862
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=; b=Iemi6Q5S+B1d3D4z
	UlUHeB+3DZ8h0eKj3YCeH7Yjx4D0c1CsTmaPKtLow2aucdVz+8W41Ps+o3+94PQZ
	r/fjqlSOOOO356AiNKX7wGDD3QUwERwZp4CAQwtXyZOqDoRKj/aHyKJpyoAULFDz
	9XM4dKtQPrzHu/1OsNRQDCipJc9yzwTkVqJF+PkgWQlTCdMGMrH2eQqKuSRAn6YT
	IgQZWPNPBiLPnSAkAq4V0ZxC7BcRyg8TRnm57cjVMAWBRws6M0gxClWZu/EY3v1b
	Tl1oeMopQqlL/Cb4wdCnXoRnyW08DEb5lvmCOsXXVv5nI60AMU8Ocyru1HEvmmdw
	uENgqw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6x5um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:12:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d985df4cfso3522570a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 00:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507574; x=1782112374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=;
        b=VE6nVr2ZITGpdURhCASK5mnXpvtFbN8/UuFKOmjFeCdY5m3T77SxBmbGAojRRTreX0
         I+ORsy02su7vYiPpSfaehZLtZhJZpimZ0reD+eSY+zUwtojqazVOJ3u+HZDfBfC5dc3y
         1mJ4hFWmlPYcUB7GFF/nnDEl3pn5MXxohY4eKEhcLjyaAnDeauwidl1LnEVMeVdKfApV
         J7sNKjVCSTUeRKfeKfVIh7CXjwx54OTQbtUuO0kG7hM8t4ueZLFYUzM5UFoP+b4v9j80
         7dNelX5NZQr4zUbNdUY2Z/b4qRrba5teeR/kmQmiPHq6j0oCoRViN6PG1h0p+/9TwIAY
         rZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507574; x=1782112374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=;
        b=S4qcQfu+/QiSDqoUyyk3wm/8zvLMXd9m3iLd49ts+TdDq4bs+4NZPFxiSGnRCAGSAe
         1eamOGnZ0OPGfGy4xG1wdOQcRAsYTpI7vRGvQV1lTnru8HI6YX0FtqRvDcg4Pw+fAFRZ
         XvTF2kL5YbEjaujvR40rEqVb96fW5327iON+tO3Bf+JR1/VUwYBBn3FDfSP5+5pJlB4M
         MJtRNSrVOni9SzdeS5ElSZZ9LXFbczC/LiJUEWFZowWdMo0dpRtI/+Dh1ab+sI5yXPdk
         E+V8fsD3je3rw63fBEZKYjh+ZpqkeVlkPxn587L1K03l2qFU90hFobuq+evDkfOwrSgW
         z4cw==
X-Gm-Message-State: AOJu0YwcjXl8/WorPWyj9AYAj+GIluEQKzk+ijh/aLDK6wTECqM7d7qy
	QmBaB935VdQ4AMdwxJuuHugHG3b30oNxDwlkr8HZgUys6jUpCwlRth2T5Sh8Ty/YLaXSwpC42pb
	3zsJOduxRtA/D8aEzNgTMHjfBoY4zLsXQ1FJFBkZ6quiA1DGVT2t80mpDcIUMOWwzOWtf
X-Gm-Gg: Acq92OHa4m3RV2kht4rB0Dsnlu1m8Tg/NVlv757XYbvmVxgNO5DrzWY4QGHEAhuFLYn
	yQ7/6vWpV5GnchiYFVTdhGaV7S0pT36DjuNWY2+KOqx/jaqxEJCGVDcBQ0VXt8mIhPtcgjNm80M
	VKcfjLoYw0+FPzLBT+n3tQbxRrbnlLOrMLLVh14prSZ9rshN9P3OQYYsnUGe3XhbBGhrSCXzfXx
	vP6ULHtf1Gz0ns5MGu06Q/2GW4p9WOc4pLwr54x5xMKt7HDCEcDIzqMJsy+7lUUXAXlMYWkmwS3
	qop42ef+p+odTYybIQt3DcAauT1LyuL8OJ+5g59MVKKBvtX89erK+gWsnccaUuh80xO+Yajml7W
	0Zv/vPxQoKPS/bxNyv5tS4mmk4OYMp8uRomN4lxvxyrKAJdMpI6i8
X-Received: by 2002:a17:90b:1c09:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-37a03ebe902mr12846034a91.21.1781507573912;
        Mon, 15 Jun 2026 00:12:53 -0700 (PDT)
X-Received: by 2002:a17:90b:1c09:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-37a03ebe902mr12846012a91.21.1781507573427;
        Mon, 15 Jun 2026 00:12:53 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:12:53 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:13 +0530
Subject: [PATCH v3 2/6] arm64: dts: qcom: shikra: Add CAMSS node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-2-8183481f48d0@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=3937;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=FD/YYzeYflttpFETR8KNzzuysuLGEKsTDke9rdJBgPs=;
 b=jcVZCP4apBgm09J+irO0tk1USXAmLXj/HWvbeobqVoyNCmVhZiorPB1J0WVNlRDLgp6ed+K43
 229TT5//GvtAKt3puMJbFWAriZwG18b0AiWjEqIl/DiiyBe76O/CtoE
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX5dlaYMoiNJGL
 yKeTt2LZi1RwaiknySOM1+NrWFX8vHNwfHUgbZhOkF1OrpmXf2MBm0tC+jO60rq0yl3JFPnYm+H
 ZrVJVk5USCKv3G6s/iDcorHL+hnq+jk=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2fa5f6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eyGvxDx9JvC1fvNGcsBVTdIMBtLTXoap
X-Proofpoint-ORIG-GUID: eyGvxDx9JvC1fvNGcsBVTdIMBtLTXoap
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX+s+uTwPJ5spX
 cu8y4tsG1IeUdLlVKQlxfqdHLfcSFyV93aPKCZTu8M7EVMArX3S6DY7DW/95wteOiwFVcEZy8WZ
 Qpvgi/6LKajgITNqHpCPBMk5V9+E/zQ2whXxe7A4Oenbyaeql2IvDboxyq8Wf8ko7Qo4XwRWoJg
 LYUM82p2NkFro7x8XuyoDVecjXS7QykAhN0ZAOXwha9cMqbadCoRw8+vIklaPGRvOOwLs2Ay5G8
 r1aa88Gy5JUB+GigrPxZUp5RWSiEYfhuAbnAgpnzjYaDcqzUuLcO11lNm+ZKPM4/6enpsuxzEMZ
 ZvsPCBV9cfhakDJpYbJ7tpyyUCjZVNH4M/8ge3ahjroUBbBrv/5KAeepgtvM1QStRpQZHcy2PMO
 yNJ1vZO3/LhTSMC+do4WdEv5BgJ1KJsFI2HtlL5bw1VJQjvlUeepUSi6iiggfN4hXWi4OtLxRDj
 o6ixcXDPhiMhAafVWEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150073
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
	TAGGED_FROM(0.00)[bounces-113098-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 5C90B68417E

Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
and OPE blocks, so only a single IOMMU context bank is needed.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 100 +++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..f0e827996609dab2c09834857a1bffd9560155a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -604,6 +604,106 @@ opp-384000000 {
 			};
 		};
 
+		camss: camss@5c11000 {
+			compatible = "qcom,shikra-camss", "qcom,qcm2290-camss";
+
+			reg = <0x0 0x05c11000 0x0 0x1000>,
+			      <0x0 0x05c6e000 0x0 0x1000>,
+			      <0x0 0x05c75000 0x0 0x1000>,
+			      <0x0 0x05c52000 0x0 0x1000>,
+			      <0x0 0x05c53000 0x0 0x1000>,
+			      <0x0 0x05c66000 0x0 0x400>,
+			      <0x0 0x05c68000 0x0 0x400>,
+			      <0x0 0x05c6f000 0x0 0x4000>,
+			      <0x0 0x05c76000 0x0 0x4000>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
+			clock-names = "ahb",
+				      "axi",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1",
+				      "vfe1_cphy_rx";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csitpg0",
+					  "csitpg1",
+					  "vfe0",
+					  "vfe1";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
+
+			iommus = <&apps_smmu 0x400 0x0>;
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1


