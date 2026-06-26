Return-Path: <linux-arm-msm+bounces-114635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ek2kCrRkPmrjFAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:38:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FFE6CC8EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:38:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HxUbdcYN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GWCczQTL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114635-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114635-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6525230A66D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 11:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4463F23BE;
	Fri, 26 Jun 2026 11:27:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3513B3F210A
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:27:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782473268; cv=none; b=om9MDjeqRe87wFDl/PhLdy+qPYZDTAwsDFJRrXB8idS4Q1zpfY+MmC9uK3+T9SbmfjsbT2QrlF7kNA8rcFa2AX5X4rv2MrT9Y9d1uBuflTeyCsL9jL6c9/JrCzHObMKUdNU+YsqOnQDtO+A1Pii8ZDn/TrALfTnup5UGYQao3O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782473268; c=relaxed/simple;
	bh=e1chsu+V2sXtpThe9ogQKDBaGShzDBEsNcW0KWQp9+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZilAzHSr5+xBHUGTrnyWqOqOiHiBSW9aCIl1GeD4ESvSLbcdjhrZtprUJ0Qs6lilgfLq1bGSfrxXghtOq7SeQKrIfqOrX22NAeS2G197br9jwnlaFOZOLbnALjHnEa9sPQUbn4Y3Iw/1GqW7LstoyZE9DrrAdVJnIt+2CqsOmRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxUbdcYN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GWCczQTL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAchi61143743
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CrQcc6pO+bIcXOxyDRMX6yNyA3dWr1QEjbfrtFcVbGg=; b=HxUbdcYNcFaXSwQR
	cJ8McPaFsqPO6UhUrK+sb11jzz6tzNySCVhcXWWoGMUDJMb0ucvdekPk1p5xU9TX
	g3LSEAv+e3J32gGv4xS2DVvPiMPxhjxJ5AtXIs54czj+f7Zg1a1IRV0kKvmVfYqf
	fW5cvWvYYJfRHNIFBGCJ+7EaLJtDEeVyizsu8gl3SFebYCkkZaP6/R5PMcKFdyI/
	xvXy8MBdM7S3ZKSenQr21jtI/S3OTXPCU1CjfJ5/Nr6xj8jQvwYIeXRltife6aRH
	up81CCE8NdlhEW11V+ToymiszuVd7oa3w9vRxds95/1kOj6yqSx0I1pOFPVfyJAM
	eYLnDg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eewadpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:27:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9229581de9eso20870785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 04:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782473265; x=1783078065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrQcc6pO+bIcXOxyDRMX6yNyA3dWr1QEjbfrtFcVbGg=;
        b=GWCczQTLl/VVREhPH7aCktgqhkVNOBkcF3b45Th+ZVgipcxMNWzQKORc33qUbmO4Bd
         V4WrR0aFpPLwXZ6XW+npFPEFCLSsCTBvTSTtkC0TV+WeUUpifaqq63qR4qaW0POLxWe0
         4tRVNpwXK5gUV+ZMxo/R6Unn05wSLcauQenVZj/4vRaLZcENtIhxBFhAFL6gb7Ys1bwH
         iIGoaR9lsfbGZPqVrQI7JAFfJQNffs7e3OSsOTNLlvccpYOekye8rlpFoR+Ak5hV6OJY
         bCgiQzn+2ofnrnoq0czY6WTKkT66AlMn5lk6C4CyJB5pOS4/u7bm0IoKXuSaE7+85Cz3
         O/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782473265; x=1783078065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrQcc6pO+bIcXOxyDRMX6yNyA3dWr1QEjbfrtFcVbGg=;
        b=eBdJViZ/N58B8UJx0HKsSB6biVuzrIewF+Fi1XO03wwsTEuWvZIXRJImqnJuCm7YNe
         Htv1AOiX5NLcWGdvbSHQAwmwXmp2EMl9VPi3XXbEO33smRjT4JqjP6Ow3qTOK2+GXG2c
         ms0eI5UGgxyt7HyNy9MJw5CugEtgCrWKuByKauP28g8gLuM78QGx+X7BLx+mACOvkkTB
         ERz68URIlbnzxWqlU6ZuKA9RuL2w80RVOwuVbQcci1Y/sDh6SYVM2BfQfQHL62Y3Rz1J
         B/p1JkHFfVYVBSQBf7beJZDI5OGlTpBOAi0qv3yVFMXonSaNVzyFmUKf3iqBFYlsj4tz
         X2jg==
X-Gm-Message-State: AOJu0YwxcQ6OGcda0SznwM4n5TEmeaP6HDUCDLBXS/K8qR+WpPzBauBo
	+wNTTlEqv/3wuciHTzvc0m9nYZsxYUJtknpmQNDILzYSdGMSu7g5nglF0h3nQo55clHxeVf0pXD
	V5W9ORkSfQLVmE5gcv4XBpU23+XLPRFZHULC0m2GrDjIKkV3N5vTJl8IorKzNfeQrRUBN
X-Gm-Gg: AfdE7clZQTv+rTuzGe9IUFPdYnd6ebKRBXoZKq1hiTvVm1aoELNtFIpqZLsRTg5lL/A
	Xlxq06orudgUMW12Ed2OC7xlSX7BXgXeG0GLNzPDbI1wJecLMDdYBl7oohRxnnT7rYlIj7lW7wW
	RjwGS0IVODb4uu8fdGBXCDItBu2skki4Wh/WOt8GcKly+UbkPNAWKo2U4kj1qH4BeWO0J/Ghr94
	Q+hV3hQMvbaH86E9HWwlrJT8EZ1Fus2L07+lJJ1yG0i272tbeNiAU9F0/A7L00eJV3VnJieVO+T
	noro4/kkiYWJW6Xq+/6c8xyV2QRw80lMQUurVHK6//L1/eKAPeECkDr2N8UVQ78V9rEs28988p5
	3mKbYPaFHoHRhqkEO6twQ6IlkF+qAGO3iKe8=
X-Received: by 2002:ac8:7f85:0:b0:517:6a56:accf with SMTP id d75a77b69052e-51a7272d4c3mr60815551cf.1.1782473265550;
        Fri, 26 Jun 2026 04:27:45 -0700 (PDT)
X-Received: by 2002:ac8:7f85:0:b0:517:6a56:accf with SMTP id d75a77b69052e-51a7272d4c3mr60815231cf.1.1782473265060;
        Fri, 26 Jun 2026 04:27:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c121af5b525sm136978666b.46.2026.06.26.04.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 04:27:44 -0700 (PDT)
Message-ID: <c6966f05-b1bb-4b71-8373-c90995ab4cc3@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 13:27:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
 <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MiBTYWx0ZWRfX1jhn+CTCFw/s
 UK/MkijTycQjOCikbuaO6SdG6WGq9umk0oUpaW6w8LONXEeyNzRwRfVOp7bMVpDTVYxwuoEsoj8
 6BN1hQZA1Fy1JJz+ZzSNWZRbtWypUkE=
X-Proofpoint-GUID: CWyvW_YLBKZw_IFlAIKUdlKBu7RCGrb-
X-Proofpoint-ORIG-GUID: CWyvW_YLBKZw_IFlAIKUdlKBu7RCGrb-
X-Authority-Analysis: v=2.4 cv=P7UKQCAu c=1 sm=1 tr=0 ts=6a3e6232 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=IGK3VjdbSyDGhnJX_5YA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MiBTYWx0ZWRfX7hE40eCOmrE/
 nkl0z/f++oC4LB8JpFCg5FDYRNZfGI6OhwRbeqk5gltJS+B6rX4yO5GzNGE2pOUjpG8YTB6Rse3
 hjl+GV02e4tzgBdrgJ5HW9TNE2xRC1mxA8w57lTgk7gnYxjMBWrc7sWWXFiKTjcq1DrtLaDADl+
 hJQ6gatqtkEH1dl7Fo9hyDEOW9oo4+eP4x+u7DbX5QgB8pxhvW8neP3nK8rsQzZt98YU1cwfXCw
 1BODrvQvumL9eoxsIpUTz3aGLNpoUytwGPKCzytpVC3h8JzjJlJmkjGrzOBsQv3JJqK3Px9WAne
 pA2Zsyi3w4zkpmpkuwyL+THCVT6KiW5ahzhx8/yofFfUWR/Wo7654iSG79X039ErI+fmDQ+Vcxd
 VsWED1QBgQ0EuNJfG3IRb018tDz8aPQOjOIl7lWP2tePVCogvRfXT3ywioq16d9GKj7CJtjP+94
 v8DCOUcsP0r0mkiohfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114635-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jason.pettit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92FFE6CC8EA

On 6/26/26 7:47 AM, Jason Pettit wrote:
> Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
> (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.

[...]

> +/*
> + * usb_2 is not exposed as a connector; its combo-PHY's DP lanes drive the
> + * chassis HDMI bridge (see hdmi-bridge).
> + */
> +&usb_2 {
> +	maximum-speed = "high-speed";
> +
> +	phys = <&usb_2_hsphy>;
> +	phy-names = "usb2-phy";
> +
> +	status = "okay";
> +};
> +
> +&usb_2_hsphy {
> +	vdd-supply = <&vreg_l3f_e0_0p91>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +
> +	status = "okay";
> +};

If you remove these two nodes, the QMPPHY-as-DP-only should still
function (it's the USB3 block that depends on the QMPPHY, not the
other way around)

Konrad

