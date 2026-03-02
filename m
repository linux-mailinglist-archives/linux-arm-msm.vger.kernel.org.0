Return-Path: <linux-arm-msm+bounces-94866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI4ML7lspWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:55:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D5C1D6FF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2089C30022A6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817B5359A87;
	Mon,  2 Mar 2026 10:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRUqZqYw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CxQuhfUq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAB7359A94
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448785; cv=none; b=dag2b1QNjTCdRBm/+Qp9/rzgFxLN7Ao7v8jqHxYbGOE5O4jZwUHQpheDmKycJB1XV20bXSIRf99D+UBxJaDyKJnD9cAt7agrJ1a454gM+qjIMEeGNR40o5NWURoDV+0PuFV4aRj8A2+pyPnR+sl1KS1XdWvK2VT50R0vs1W3YBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448785; c=relaxed/simple;
	bh=fe/85YbAS34hIhOewhPBeJ8TG1p5VlQkwn0rJE/+CvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SR983ou4+7UxG5QIlNhpQYnOapeoLuC4irpFfCIPQtaz/FfcgNpa8t5VA69u3+9Hg4SxYeMu7afHJ8YMSfdd+1ZUCx7DH9UX8D2rc7MMe6VCorSlRVDtpIJbO+jwdtsfXXe7dIboKbzlPB09YgPSCC77KvNZn14upvwqIVe8hNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRUqZqYw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxQuhfUq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294WM43752736
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HebYshJYj+gI+xLXI+Ndybjzq+1RvrWWlvilsUSnDps=; b=CRUqZqYwY54yFiOQ
	eiIexbRAopp9MUMnfby/ReBYp8dx4I2p5+nFj8nLlfJ//GjRGX+PSGqxaky2+C+g
	7c61K6XvGqKvZY6sVZBgR97nsmV4s/yFvIyILHk8HbgDuVoLb3nI9cFTnfAfEpvw
	A7tPf4acSDg5iGjrlaQhw7o8kgdR8Q3xVdFTXWhCw+G64+9hmHObXtKw+S0sS50R
	pjVTl2i+plvhvDykGoi3vBsKg+7eUSPEs6mgLpX+dVNTDPUasyugXCoD8W7S6Yok
	1b6oonFfGjn429Y888qXXwItcUfAe19LeNG9OJ+V/u0LFHCX94Q3niHKKBylSKnv
	hCmP6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq8d0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:53:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb50dfd542so411382685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448783; x=1773053583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HebYshJYj+gI+xLXI+Ndybjzq+1RvrWWlvilsUSnDps=;
        b=CxQuhfUqi1BiKAffOzwVRSlNpz8G9fKgDQ8P6l6TmIbpWkIJJ+HjzcjsQTDppmNiaz
         HrVB7pvSGaNxc+fAnXDZ8qzE9Hs5vwXsg3VSMOq4bxrZOCwXfTjZjugi97AsaBE+Gisg
         oCFiCXwqs4FsN/q/thWFJF3N0ghy7VnPlbyBOgn5g5yM6p+RvFSNZ7P358wE/2vLjwGe
         KjXiuRjb7dW32QqZVwclG6xf679Oz00Ffcp8iHbFGc7omUZJq/X6Anq0ncH3gPbxJ91C
         yItQOIulhVmKHawX5g/W6aFSw/iTs+M5uII1O+DY0y2NYm4QjtbLqVw9SsIX7f4th1BD
         iV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448783; x=1773053583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HebYshJYj+gI+xLXI+Ndybjzq+1RvrWWlvilsUSnDps=;
        b=Vueu3sAdi8a9vAVLkSTNMi32EuRElGrzRsig9P7wmun6pDGFLAosFLUA3+E1oCNNqa
         OjXVPU76aLnXplBErrZwZN9463kjc675dz/9W+Zd5LlKBn51s8J5CeTwEi5EQg6ub0A4
         mXeyjuFoysa+vsHCt+ul2YpkZqgaYUR9HPIt2gppr2uKPGbn88inSCFkKIisWmWvbs2H
         13RYG8YTgDXdNB4eM/OLSe2jE3LmsUs3hRAS1vMgdnU8dGVYDQmQXQOhkuNeb/MuNGR1
         4CzzXKtRBl1i078oB4zJ+SM/RavsyPc7UBgKTu1FKF6w5qcCkqB35GR3xKZ9O2rT6L/3
         jGtg==
X-Gm-Message-State: AOJu0YxKWTelLtZjmsA7ryl58uiKddHR8uL1R817kNrpXW81uQdPjx1G
	DUYurAdEvj73ITZ6kJLbadQnny+743XDTRD0XGPAWqWHvRkMP1Eqh7oBN+p+fZQpVbOAORpdRRj
	hT9kEI5I0e9sUmySukvhsd+VGk85WyrD8qeV4rdcGJTaurylnGNf+y+SYOK/94qgfhwES
X-Gm-Gg: ATEYQzwg+bEQUPouaLo6MkUwkDzOZ3qUTCOjbFBy/j7DE0VLbVueCvgzR4xODvP6dSg
	oIrr8nIICbz8LyN3YYpw2DQb6e39m/rYEYWfgi5YJxXHWGVnLXMZJ/jpAeYHHkO8vGhBr4Eyjwm
	DzBYGaw0t03PB5fxT6VFcyqFsLpDwwY+hzrRbJKzV0WZajvzkwam/2KLjQVjupIUtACWahkrz/X
	9MC8C4EgLELR2W9LEnndqBGctm3yx7+or3VjLevW2qri0UV6xepgaLlqFErBw5IMrUoj1JG6F14
	ynsHSD+xZkF42F+5BU1oDqhUVWpDetnalFIp3/znmnhWUbduZsl7IW5uq1oUMToFeYMXVC1WldW
	mycXT1Qu8GB0k7al/eLK4yT3E1P2qRJYl/BEncjracWktktsLD4X/OJmDqgC0KEFJQsbbbYnwhZ
	EvrEM=
X-Received: by 2002:a05:620a:190b:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8cbc8daba6bmr1154646985a.2.1772448782943;
        Mon, 02 Mar 2026 02:53:02 -0800 (PST)
X-Received: by 2002:a05:620a:190b:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8cbc8daba6bmr1154645785a.2.1772448782542;
        Mon, 02 Mar 2026 02:53:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd467d1sm3339621a12.10.2026.03.02.02.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:53:02 -0800 (PST)
Message-ID: <76e7633a-5703-4cc3-88ee-52e8a7c6701b@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 11:53:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: ubwc: disable bank swizzling for Glymur
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260228-fix-glymur-ubwc-v2-1-70819bd6a6b4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260228-fix-glymur-ubwc-v2-1-70819bd6a6b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CVdZzhQ-lPfxq3SzyFaUzMiJf6jJRNeo
X-Proofpoint-GUID: CVdZzhQ-lPfxq3SzyFaUzMiJf6jJRNeo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OSBTYWx0ZWRfXwqd5GNejMznK
 K6cWi0aI+23upQSPdmd8cBqEOUErOcLU4YXkDznJesABdrjG2vTZykRldl8Y6B38g6CjPLQFDxp
 Msj5kPsbIUSJFGHu9tAWrWe5JhjNxnBFFo5uxV1urii72MPiDUD9KN1os9HyyyT7shLe41UWCfb
 9e/0XLdaRjyQi9Wvt6Og27keyngcewvXthbNYLw1taIvGZ7MTH2rmp5rb0odDNLyEEm1QaOLcdC
 6wvYxPrd1qOVMIJErVKNxuqJHxCJgeFa2TNjMzjbKqUR1fpGlTkHO676eDclVp2qHHkq/rbIUl0
 LXw+jTztCgeAvGxCM5k22kCioLcBnUJOtGDGBqWt4jACaUTAP7YxILqnfYwnNOar02fJvYHuijJ
 hAJFk4bhCTimTApqU7Wev7G7dix3blK4RuLygAGAwSqjqrgjddAfqjJrF/dAgKeOELaslsNCIey
 rwYoESoqGiYjPsQghOg==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a56c0f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tJH15bp18cgGOWU3wh0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94866-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22D5C1D6FF5
X-Rspamd-Action: no action

On 2/28/26 7:34 PM, Dmitry Baryshkov wrote:
> Due to the way the DDR controller is organized on Glymur, hardware
> engineers strongly recommended disabling UBWC bank swizzling on Glymur.
> Follow that recommendation.
> 
> Fixes: 9b21c3bd2480 ("soc: qcom: ubwc: Add configuration Glymur platform")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

