Return-Path: <linux-arm-msm+bounces-101922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNPOArpG02meggcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 07:38:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8D03A19EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 07:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8121B300E27D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 05:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D7031BCAE;
	Mon,  6 Apr 2026 05:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A+mibHOU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE0F30F7F3;
	Mon,  6 Apr 2026 05:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775453877; cv=none; b=oEvIxd7RrSeIIXRXG8ETSrmDHDw2fMvUvd66yzcay+tkuVGrCMEjvUWmKxjs/b80ZZRBXBDQMPGRIdluOsiwzs/+5UI1UrptoGbp96sBbVqzsRoMnOVPl6+s/76eYrUCosnihjytcVTXNqnx+m1p/fUO1Fk5+EXKlyo+NoLBSXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775453877; c=relaxed/simple;
	bh=xka/BNXeDp1uVX3YvaVlduhAM3DwanV8Z8eOEaO0BA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=p/wVIU7JUUzN0RhmzgRcHQWgbKLJ3blOjnts2Cx3G+aYNZ2KaYZKuUcd/KfVBN3s4ABY2ni/W5+w2wt+US9zhwVBjuL+PWblqk/FuALBUZ4cWsw98wkbxuiBxVsbWL6hbNPZp0bQjEFZLi4N1iBo1LuRH8GGc+22ffpfL34bn00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A+mibHOU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635Kxn4d2469655;
	Mon, 6 Apr 2026 05:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YyI5TkSACvWGUvK14TlwFeP5qGh6tpysJTkDEm526Q=; b=A+mibHOUDJ/oj1zW
	ypd7zDy9gjx00mlFsB5NZKJrWKCg+WlOfweD/H8MDGW5uT1NRIY9+Emyozzbi59D
	LuzXdyO+Wvjnns5L31ZdbEPFWekNhFqxeUxBCIF9tIfN4WqFlAKVHvFH6AlUctxK
	lgRU22QG/wUScuc0n2ozu76RtoL2CPYsHQFoEjx5GAJInQxuFM91EQsfEM+YVBgg
	P2GEAUF7XsyrXayJmiwijFLiDGdp7N5zU8LN3vuGtreqgY6Xp8qkZp7XvfHM8Y6l
	sIzoFucUGPWj5wDz75Go1V5ElosLypVqOw/XtioyjQtqHoY74OJ9iGzV5NeqcU9V
	5CxdqQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mm53s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Apr 2026 05:37:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 6365biBn020888
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Apr 2026 05:37:44 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 5 Apr
 2026 22:37:39 -0700
Message-ID: <ab0a0a53-9a54-4cc1-9e07-fee4891d7516@quicinc.com>
Date: Mon, 6 Apr 2026 11:07:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/13] soc: qcom: geni-se: Refactor geni_icc_get() and
 make qup-memory ICC path optional
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti
	<andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Mukesh Kumar
 Savaliya" <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya
	<viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <bjorn.andersson@oss.qualcomm.com>,
        <dmitry.baryshkov@oss.qualcomm.com>, <konrad.dybcio@oss.qualcomm.com>
CC: <prasad.sodagudi@oss.qualcomm.com>, <aniket.randive@oss.qualcomm.com>,
        <chandana.chiluveru@oss.qualcomm.com>,
        <jyothi.seerapu@oss.qualcomm.com>, <chiluka.harish@oss.qualcomm.com>
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
 <20260227061544.1785978-2-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20260227061544.1785978-2-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: qHLzcZzxQ7RVI3yD_tKE2EkmmtgFJ2mM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA1MSBTYWx0ZWRfX/37BpdPEmBkT
 o3HiItxOcwn356DWnUKQ3TjuNuy9lpDqevAwJ6sdt7ytmTGarEuTL5X9E6I+exHtF4vIa4J/dhS
 BIpj2Q0k2cNxlg6+zcre0SyJpORRZENxe037FMoVYcJTJc7NZbGYS9/QOpP1U2eZlopuDONAYmn
 XlTpYmi9mf7A0SIO+hTZGJBSqShYQ3YpSdDBlHFKWO0bmHDiCVOur8rmRrhpQI341c/uKP5gdTK
 w34TBdr0mtcX492bmwlqtN0Gs4krL1hJ7YO4FwIImpmMR7vL+91As8NsWfZUmbtbRtfAsfSYFOK
 t9n7Lgkla1jh8drD0ZYhh6Lejetd8W6jzkFs4iFBQbPLQL0OoQ9NfjHeYZXcuno5tvJR0odNi9W
 zryy7IZZ/D9WJsRyDMSIAFRl4rfF+RlwMp2Geao5avyiTQlxD9tndsT0zDQZ2hYMKE4tSn4/ZDp
 khxB/noWFVouwpFdr2w==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d346a9 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oWXG0iUhOD6hS4_7Al8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: qHLzcZzxQ7RVI3yD_tKE2EkmmtgFJ2mM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060051
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-101922-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_msavaliy@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB8D03A19EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2/27/2026 11:45 AM, Praveen Talari wrote:
> The "qup-memory" interconnect path is optional and may not be defined
> in all device trees. Unroll the loop-based ICC path initialization to
> allow specific error handling for each path type.
> 
> The "qup-core" and "qup-config" paths remain mandatory and will fail
> probe if missing, while "qup-memory" is now handled as optional and
> skipped when not present in the device tree.
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
> v1->v2:
> Bjorn:
> - Updated commit text.
> - Used local variable for more readable.
> ---
>   drivers/soc/qcom/qcom-geni-se.c | 36 +++++++++++++++++----------------
>   1 file changed, 19 insertions(+), 17 deletions(-)
> 

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
[...]


