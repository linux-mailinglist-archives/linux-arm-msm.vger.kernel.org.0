Return-Path: <linux-arm-msm+bounces-96198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EZrB2ujrmmbHAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:39:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB4A2373CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E439304E30F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1F63921CC;
	Mon,  9 Mar 2026 10:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1ONAfeO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKKZqUV+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5678A38F256
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 10:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052690; cv=none; b=St3g/fPaTkaEzH3VpvEHErTIAqg/IV4FJ8mRSdEbzkvreYGW/p0v6wtwxwSLCdK+Je7T0sZD9WnQlTxfdLP/aMZf6O3OYV2BHKl184ZZ/tcsDaDrc/iTleDvmEPdBpjOgSmuAFCq0Y6Q/tJ318SocrOF2RHoYQTfwsxJ4aq9QJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052690; c=relaxed/simple;
	bh=B5DhKyW6XnxmZCh84HVUvLOd+qT97CiYfHEmFjfS27A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ThbmudTZDOjHEg1x6oU+Er2eYLgjMrffWzFIK3QhF3S4sgP94RMyEvrV6O29kXpkyGZACPaQKvuLYHrF2a12kbL9+hng2ShHs+wFUQjRs2y+0NnpPeLoZnssEZkFqnOLIj+KvAyqgoetngjrUGOj6tfv/6Vut4086nTzMhOz5d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1ONAfeO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKKZqUV+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62989wJK2661187
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 10:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	toGVqDilV/frdxrJNFy8PXgYOTeFfEpHhK5xed2QXzY=; b=V1ONAfeO0HIy+8ss
	MXtZdC/z6lVQdmGVaOuxXxzRy4DM/VQVnW5KOZeVjqVI4X+ejljjcsZZ2F5A7cgh
	PaPpAY9B3SBLvabOy6QGflcfkCadEfm3U2Sx8x8l2NhY64bc0ey4zsyAKBAxotBv
	ElYH07DuRSeFW3yRqcRYBLhP51aYgVjoCFLZn4BU/XupxetsSAXUpyfjU7to0vPM
	ikFgU8+Lfj0zzQ2GVD2OUT/NOxCIDhzXeH/kSnC5MGy2DmUxW6A1UwjQrHyQL8Xb
	uaUqRcR0qxFU6g3wzyDw+oPR0MxI+mdk/Q8AUe+8TjEdfNi1s3ECKDZernD40BOB
	YM9JDA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpnagu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 10:38:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-895375da74bso85956306d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 03:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773052688; x=1773657488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=toGVqDilV/frdxrJNFy8PXgYOTeFfEpHhK5xed2QXzY=;
        b=gKKZqUV+ycHl5mBbV5iqOiCL1vvz8nzM4ACKFxz7MZFcJbClr9VKBr7mTF/Y/Yg7MR
         qCIyViSzl0Rh+VRffZayRyWPZVOYytlF18oklSbRzHrgr/wuNABUVUUZ6Xvy14GdqwYC
         s+TIlwkinSoj9Z+1qf2t3GiI1YqXm4mC7wdT+2L0/Ey4NetcBUUTyZWvglrCWaJ1ZaRu
         vphTGW6m8qFiyQ6Z+JHWXAeIbnCHt0jDks2dQajEV2g7pOMAP11z2tospFYxTzq5xefx
         ESjUTHIQP/rr3RYF3prugvoIvqHYkDAxQRq5rJBUPmspL+Vr2ntKtCDO8AolOcQW1lzN
         oZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052688; x=1773657488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toGVqDilV/frdxrJNFy8PXgYOTeFfEpHhK5xed2QXzY=;
        b=lF0qCuUa4Wk0T26msUIP4RwLgildxSqf83broiEQey2qfPOK9gvEU+/jkkGJnxKEmo
         iFECxcFrZZjP+RddVrTILZIDRy/mbMCFk2jFg2wnGZIk9A2cfJ/aGbzeLfv3lIJGFhol
         Nmji9NMvwAu0XmjQm+SskCIeb8a+JMuDdg/11E4r4IzoRyXYSpjr1kWXeT/sdrm9JAQs
         j7WpafnWgTmIDfwqjK2WTptZtxznIcKCdAisPkKQ0P0eX5/tIJps5rV429CT32Vr35V/
         OfGhgbtAhkEsoF4Hwr/+OcommnhHSoWxL4l7WAzF86Pmg3tgtGyzLMny22k3pbJvxp4a
         EFsg==
X-Gm-Message-State: AOJu0Yw7Ontfd57giy3797fgvwO0Nl5TH3jIvT5NPngFRs1zj9oSrCw0
	PaQIXSKGlvLM25Qu9KqIYDENEnQNG+lJUFP8T9kCv7GzbsvjA4ae/sGpHuoxCut5TE+kix+NCLm
	T32uQBckbWyUy4ic8dwGZ7/KAnoD4uuRBYuwXUGayGMIELirGC5x2am/jcTYfMmjmOzDS
X-Gm-Gg: ATEYQzxdW7JJln0IJOxqURvjgQbzCFoD3b0ZQOj3kPZswUMhHMqSxvy3TEW2dRQYeVr
	mFDgEcGDlhkufXE4XuX7vs5vTm2E32MU+YMzIbttvOTe3i78W6GLFovDbggVAc51fH2LayILfzR
	uparVVBF9X2i6t33XFpDgJJ8g6jUkvHhH2TXMieaqf14Gm5yZ02aewkrNonGG8rnIkaoCr+X5hn
	1ZzLbimR3Lly8FROpkXoNfjLWdAB4R72B44QCc/jHuoCZXCQlB6CnqphmeegZvcGPcA/LSCLF05
	bZhqEs1zkFhJUj4LQ+nMxF+B8i9AvatHgy+fWW6qapcwIBiDNZYgzlYDm1KLVV+ITpw9eKq/d/Q
	7DiVUOXAVw9POOJcFDDrFMJJRx+ZPKyV+5bK2a4ZYG/0X7Ixls8pAskmGglDxGDde7gCXKnNQ08
	N8OM4=
X-Received: by 2002:a05:6214:809b:b0:89a:50b4:bc94 with SMTP id 6a1803df08f44-89a50b4bf54mr16300686d6.0.1773052687577;
        Mon, 09 Mar 2026 03:38:07 -0700 (PDT)
X-Received: by 2002:a05:6214:809b:b0:89a:50b4:bc94 with SMTP id 6a1803df08f44-89a50b4bf54mr16300546d6.0.1773052687159;
        Mon, 09 Mar 2026 03:38:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f139e3dsm353902766b.36.2026.03.09.03.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 03:38:06 -0700 (PDT)
Message-ID: <f8c968d0-0668-424f-9f5d-8ddd1b6f3fab@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 11:38:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Fix SVID=DP && unconnected
 edge case
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jack Pham <jack.pham@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260306-topic-pgaltmode_fixup-v1-1-ec154b2d8e89@oss.qualcomm.com>
 <7fcbf142-f2c6-4b9e-bb63-befa553aceff@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7fcbf142-f2c6-4b9e-bb63-befa553aceff@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5OCBTYWx0ZWRfXzVdiUE0lXJQF
 nIAGQiPZL+qYtjOigVEgx+lgYsCiYsoaNwrt5rqN2mBqMqHJ0C0qIeDCBb23Z/FQUDYRVNPIQrm
 IZvsR1BvbXnNvvhGuT9+AZf87yVFgSVCMrSzCgihzKzIut0feubUv9f64urygMI7Dc+DYLIe8DV
 uJmpE0o7QPOEPn1AFOhMeIum2T1fPL3T8RE95t1O6DyEPYVI0I26KqGemOObdm9v9cBmQCaummP
 ec4nM5DhuWbpN0+1QIhhQniJ1V5XU4uoZY7aDRSWfkS5hEEzjiHIhZ2rlAgNUUXoiTRSoLCHJGv
 awtB1QcG3IvHk5mTFv4SVcKWl8U4rYudxbN0QV0zqEhbdPtMjtY/AUdcKgNTYNYrAx125Gi/XrY
 P9Lq5MABkabe5JYSpDovSTKrstMRtU5QAZc3Z5QncG+0wgS3IbUuoIuOY6rh+C6s3NRNBHBTM2a
 fgVz6gxYEcNvpol3u8g==
X-Proofpoint-ORIG-GUID: KeyHREvibrSNx6WFd8sp5FChzABA4FCQ
X-Proofpoint-GUID: KeyHREvibrSNx6WFd8sp5FChzABA4FCQ
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69aea310 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=vvrTTaMuKQl5oY9UaJYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090098
X-Rspamd-Queue-Id: 6CB4A2373CE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96198-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.958];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/26 3:47 PM, Neil Armstrong wrote:
> On 3/6/26 12:20, Konrad Dybcio wrote:[...]

> So what's the difference with :
> 
> 
> if (blah)
>     ...
> else (alt_port->svid == USB_TYPEC_DP_SID) {
>     if (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN)
>         pmic_glink_altmode_safe()
>     else
>         pmic_glink_altmode_enable_dp
> }
> else (blah)
>     ...
> else (blah)
>     ...
> else (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN)
>     pmic_glink_altmode_safe()
> 
> 
> Before, if mux_ctrl was MUX_CTRL_STATE_NO_CONN, it would set to safe mode whatever the svid,
> now it's either in the DP case or at the end.
> 
> I don't see the difference here, except if your desire is to ignore
> the MUX_CTRL_STATE_NO_CONN for USB_TYPEC_TBT_SID and MUX_CTRL_STATE_TUNNELING.
> 
> But it doesn't match the commit message at all.


The difference is the call to drm_aux_hpd_bridge_notify() in the DP
case, which isn't very visible in the patch diff.

Konrad

