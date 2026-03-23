Return-Path: <linux-arm-msm+bounces-99221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODewOmkowWmbRAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:47:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9C32F16B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F19A9302263C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04EB63947A8;
	Mon, 23 Mar 2026 11:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2aE8r1N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MzDgilRU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D2B39098C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774265972; cv=none; b=PUSzTzlmPURzfw9gkUCSe/qhWKCGDBu0UBB2pC++A1mDjfYFfuvT8sotnKRcl+wKqUyXDGtYV9/3d6JIKiAcAJsJwEcC6QnVpEqr2LWsPS1evJyDPGU4MTVEu50FTXMHmbrM8J3QsQRjcMeZFX45yqEZL81/hHJDQZtzOgg0NPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774265972; c=relaxed/simple;
	bh=zTdPu2zbrYY4TzKzy//TjpnkLLgvFQbWvcqEQ9p5eLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yfc3TqZ762tLTG/Q8np8jWiJYovd8tWZ6yy25BVQ/oCOWDA+oahYZjph63BMe2+TbkXu4aleuL2aAbgWcTSA0FVbpzYYqobNgKhJsbiilNJTOG9pDRgrVibAnnbmqukD5hASP4zYzEAZvt/CGaF7yJi34rp2eAANdD7jJo5rFTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2aE8r1N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MzDgilRU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83oPk1364146
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HQEOeFVr6mH2EsbiLPybn41eb/chStHBnXQxwYjTbeg=; b=f2aE8r1NiIajUtES
	pxVI5e9uzqCgexXsUlQmCKxdL/XpDKWZosmWlqVtrqJ12/bi0DAaTdDUhvyyRTgT
	QRMTIQs+rAaTqxxwq/cNDZ3AezDzu/W+19+xIs2TxtTWodYFc9DXBT5EHVfW+cBf
	hpI2LRfiEbnTrMf7QeOZiBnZzsRdF9gMY5Ye4VV/UGqg1Jv6G0InMQX1/4KXn6F5
	5XeFP2vobAsmGN2eKfFpYLMgsfIyNNUV9ysU/Ylz0uMQ01VqW5af2OLiAhnnnJiR
	Mxc+brchse9bICuSt6dskjZoZiTWZQcuV8mPEJ9BoYV1tVzCTmCzwRaX3v/jonou
	ILOgmw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p78sc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:39:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b32feb719so26915951cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774265970; x=1774870770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQEOeFVr6mH2EsbiLPybn41eb/chStHBnXQxwYjTbeg=;
        b=MzDgilRUsCFf0myNUAXYoa8AnS72DbEOW+tYSUqkUmqWkhH4uQieny2xgTfobx7HTK
         JklJkwInd+320+5BTcUftE0v+SeYNI9Z6vvGEJ2ZInrU1fC5DUAn2DTINXTG/t3uCDQJ
         mnCAb7FVM97Uo7YMbG+i1NNYWF/rq3wE9NR8G3sIu0vD+xqUg8s/kbLcltDn5VPaCd4v
         QK1LmjykwO+25cACqfDvGWzlZunv617Z9gzCyAAz3SVPS0EeQBkR0k73ixB0v+5oSj/2
         AsDWD1wNLuRbwosYZejBLxjcF7mV+wTsIQ8bHRCO68kqSbuKJ/kBzx3kf6xmNxIILccS
         v/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774265970; x=1774870770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQEOeFVr6mH2EsbiLPybn41eb/chStHBnXQxwYjTbeg=;
        b=JwXwtwSuCtA+kY9FYoEyM95wlBDNBK4hK2dSmisM0LO1Mdr9uJkQZaKZ8Hje6DQy2c
         0y1DzQ5BEfY+O9tD0jShdGtKxNftaaGwi61Lc+EMoX45ILBGYLjRx/TrE4+w7pWsheYQ
         7MvphcILxV4NfGVSzOLtIE6iLtbxdqL4tXbWDEpqy1VZC3XoR9C+d+kpqt4run5J9jjn
         MfeIAq23kkutF3y3bIgxWKPKNJlwolM4HB6zBd7YJeXDQSoZkCOplj+t2gAnwWsg61bT
         PbjdCHXFacjAI4yHfle6DpaIcyh3g9LsWqOmFfr1Oypg7c6fUJYk2r2V/k/mwOMo3qV2
         d6SA==
X-Gm-Message-State: AOJu0Yx2/cNYaECR+70ZRjj+qfwkfG2ihpepZpZrt00hFRiibkESUKeU
	RA0dn03zZvhpvielmenE0cOQXgvFuO8wMFzO7wy/SRImoV7aULNdY57t4i0MUeiGhgaP/1fAGh0
	l0J01Sj0n9vZSi0tt0ZiVKA5FYLNrclAOTEJBUCMiaXaegYVfsI/iUfSTaogIB3UUq35/
X-Gm-Gg: ATEYQzwogE5TPvtF9hAAiNjKGDKkFfXJZMxpunh3QymOCm0Pl2VjZ7kAw5541go9Zbc
	VWim8U5UXmnoVfqT+nGNPpTx4RJh+U2VLmHRl1BYNbcC2IgI9svkkZLa4dLugKdnL5e2Tcl075F
	ziLIlUuRkdBYPhCH2B64Yq3YZD/YicbMgDaCKSqAo/jibuivQ7Ujj/0R7x+hXOSWGfP6/VR0ObT
	R1R7p+blVTbnOLwAbnZtMXPYOFTjc0urrbw5RuDVSSbo1pagZ8oMNCmrR8GxK4i1QE8TAPT8o/a
	/ijP0dSGme/g4yIypl635N+ZNjQNRKavRtwKly/BerUD2STgAzlJ0JeuJA/3HWVU/Zh8INxdL/b
	gVVpGT2OUBofJMKw/dkj2IQnqAnrpSOCSmJ1e05YOtZLEY759Kly4R18Ty/lCyzNQXh7Vl11H3w
	Usqr4=
X-Received: by 2002:a05:622a:5c8d:b0:509:e68:22cb with SMTP id d75a77b69052e-50b374b1751mr138865801cf.5.1774265970275;
        Mon, 23 Mar 2026 04:39:30 -0700 (PDT)
X-Received: by 2002:a05:622a:5c8d:b0:509:e68:22cb with SMTP id d75a77b69052e-50b374b1751mr138865581cf.5.1774265969893;
        Mon, 23 Mar 2026 04:39:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d2390ec8sm3631663a12.25.2026.03.23.04.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:39:29 -0700 (PDT)
Message-ID: <bf383595-0452-4f11-935d-f92f2971670b@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:39:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: purwa-iot-evk: Add SDC2 node for purwa
 iot evk board
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20260323110017.2527956-1-sarthak.garg@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323110017.2527956-1-sarthak.garg@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c12672 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=AmaZaSnaQ4QkEvLBHnQA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: f9ye2e5Un8WRr6oSiXNQd70FKM_OYGJ7
X-Proofpoint-GUID: f9ye2e5Un8WRr6oSiXNQd70FKM_OYGJ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5MCBTYWx0ZWRfXxEAjf/S1MXLP
 p7H6k1dac3gW0akMbOiiTgB4cG/oMQZzGkw3yKzdmzOh7SMEA0K4S4Q/+tDcAM8ro1m/sps/fbp
 gC4Zc4mBz8VRpqbi6rsYWlaVpprxxf+5WWra97brOzpMCEMvKkyo6RPazL4pmoFiSCWF95fHlvQ
 XlIq1mGAuszMQAdVBU1qPhQ37j/kxVbz3xQlvKtkaLDxxJipZfVhPa5hAA5z6NmGlD5AEqBd5PI
 5gk8z2HW9hr/6qaInsThvg1zITZkjIqZNmRs/JRXmbsTTx4OQhIVmqzH4e6zTeNru84rsR24Igc
 r1pBvfZ6Y1ANrG8qq19dJLdurEkTqMKPvkKgsWfYC1HAWEwOeLe44InSURwxs+3og5la+2tDZ8O
 0zQCaSxuwFfsbbgBAWS3WSOCAQUQ+Vbe8rUvujgL1D4SyJgDiNnxqKrb+s9CN+9t1oOsKsbgkuo
 EXnaygXnalyiGoyaQwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230090
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99221-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D9C32F16B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 12:00 PM, Sarthak Garg wrote:
> Enable SD Card host controller for purwa iot evk board.
> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

