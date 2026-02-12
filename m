Return-Path: <linux-arm-msm+bounces-92694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCW/AH7EjWnT6gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:15:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 402E112D57D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC78B305ACAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDC32F547F;
	Thu, 12 Feb 2026 12:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FMzCCzje";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e72qXzCd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58A52BE026
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770898554; cv=none; b=cKXylF1ijptWpExcHhThugc/6Ad7E5YJzJD5BcAigUuujspdfNaalDLLlG77Tbt9Nwzs6fEXOcU9txzdZrLRhuAkkHtjOPxi/wnAWJ/vmcjhdrGzV6LveuSRxWQttvs+xu9ZVovhaW/mOOvpw78V+763xCUFzck5Q/6rfC65Hug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770898554; c=relaxed/simple;
	bh=mvXFW3TwvF25pasSV4Nu0/gSKrbTmSujc14bXMH92B4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OG7YwUQeTOhHu7Wch2cNmV/yG6v8xcwkNLrSmKfMu1eAgIxFmsOFbcZdRgCsYWbVh+VIDqFsP2+jw7ncVYuMTF5gH2iQzbQ9+UPoS3vLsfro6CPgk9sOj0YZOcISZ8GdHJZhpfnEvCetfl0hpmWKsdiLERbbReD2kbesfK2mf6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FMzCCzje; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e72qXzCd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAIHTt657744
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7IV8Rh+m4sy0TdQzsDwPodyluo/7YSjFLSW8vkruvQ=; b=FMzCCzjeeGMbr5e9
	+h+ODf40SEQlYN5LGDHLyXvbRcQguu0Xm0as/rqPT2TStgJvOffFlj4TBQHk9wDB
	ipdd0VfY2B4biet1pMPXhuBzjOzL4LVBJ7t5qr2I1ZxL5wcXxlDlC/mWWBbedpaw
	ELC3jJUcfIfwzPxvyuHcyPJvSgD+Jno6XvKMq+Naj1V+51acS2ymC/VquuCFDAHQ
	ucg1PJooU85fQnxk2xtpqomAfu8f0QMzPAUlK1O/3GMcGBXcFaLR5+NKnnbVFRfs
	z69TQz5At8/Dw8vMAi1Het1iUVwc4ZxwfNJFQVfRVSFHeEBdBE6ruMxk1vYx2/6z
	t7FxSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9d09gb8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:15:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52de12a65so150769985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 04:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770898552; x=1771503352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E7IV8Rh+m4sy0TdQzsDwPodyluo/7YSjFLSW8vkruvQ=;
        b=e72qXzCd3P5KsTfNL7ORcXQl4O+fGR4YtHFNgmgj2WcO491eZFjByzdFbccZO4oJvX
         FBAxpfIjsN6lslQc5fl3WPLyarlQqNlrO2/9CjD+C9fzULuE/0IG6I4qnRU+gHhRomNc
         BDeXglWoHnP7RTOvnjKc5IVoSZI+C7aQE8NaQv4h45VAP4MW+MAGWfmVpuxvk60CynUX
         yTXp1NCIg8f2Lo3NolBqtKHoKVIw9rvudoObpWIYK6D3ud2xVUdKjC0hxCLX6/x+2QSE
         yMrVVGvGy57L7Dw6QkIs97D3gWY39+QrVFcpF0cRnibuoa4B9nXyxLeiIDRwI7YUDdka
         H5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770898552; x=1771503352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7IV8Rh+m4sy0TdQzsDwPodyluo/7YSjFLSW8vkruvQ=;
        b=ATJItQ93Myn2CwZ6ZDlXByCZTCZiob8m03Xm8wTfR+3Z/a9UVDXs2GD0oVeAbxiDig
         J4JyxwOR1WfjVfjirker4o7pY1Oj5PZYj9EDeItlBO2Xbvg/ckjptvmt2XrqIPxsdiBg
         RxA8vSLRW9/0zgQO7fTWvtQ6cXmdifdhNexekpxRon9Xm7wBTdsLzb7layUtY9/LCDo+
         NfihsjlZ2jlqrpy7MqjXdBw+xihcNlr4TZyYLs/aMnoLMOtzdt9JT8t5T00mXVUJHR1E
         DkCOjLOuNgL+03f/ZpfJ0d5Izf7GeAT3pFYMvjTXBZUMRBAJQwvkGQ4taMCKbCneir4b
         XuBA==
X-Gm-Message-State: AOJu0Yx7EnCXK4FCXY7VjywhIUi33h/CiBtLI3NfBQiWerX97fAvMq3e
	eoHoCYPVaEXWer+qyODUkrAUQt9Z+rQSMEBW+YzR+cxG8UiNl7Gph7Phlo/0Qx51+seK5HkhScM
	GQ7LF1E7PLIz0U6JHiBgTFykV9pvmOfb1w/3vw5kMpgIOj/RGVHqenZ/enGep/47EIQ+M
X-Gm-Gg: AZuq6aK+aNRQvKut170ada9QVQ64jLIHgwiqrPTqZffP/Qyi2cyQqhcIP4SrcR9bRJs
	UpM5rwws3plF/W49tb/UQJ7VzWcnG0IH1D7qfXB3yQpoapCdFLJhVlUFYCVmwtYQCBAU35U1eF0
	70SF/BcMk/CTYuJu/PB83hzdH7nk6PP7aciTqRZlvYXZj2zyqCQm62pEOhpWRr82or7GjH4uY6N
	QSU/dlMXjxSUakR+md9Cl8K3SBvVCF8SErsJ+7k07Vo6aV/GbKQi0Ddom/2DEhPUnu7ThxhcdIy
	XVsGfp4+gqN597WWc2E/7pYSHTY2CJ3ahfbogbh8+/wwvUQ68y5f/fVZUrhS/9/8rt1BGxbjcDZ
	3Vr/grbrIlfrB1IdqFbfI2lRoXOkkPAqbt3L4m1bB88iXvjWDLrfutORCSah51q8QTta+i7wwC0
	QT1xc=
X-Received: by 2002:a05:620a:4547:b0:8c9:ea8e:c55a with SMTP id af79cd13be357-8cb33077100mr230472685a.3.1770898552210;
        Thu, 12 Feb 2026 04:15:52 -0800 (PST)
X-Received: by 2002:a05:620a:4547:b0:8c9:ea8e:c55a with SMTP id af79cd13be357-8cb33077100mr230470385a.3.1770898551786;
        Thu, 12 Feb 2026 04:15:51 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6eca3fd9sm153259966b.60.2026.02.12.04.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 04:15:51 -0800 (PST)
Message-ID: <1ebaace2-5ae4-45cf-b120-9c11910d6057@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 13:15:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: lemans-evk: Enable GPIO expander
 interrupt for Lemans EVK
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260210125348.2800846-1-swati.agarwal@oss.qualcomm.com>
 <20260210125348.2800846-2-swati.agarwal@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210125348.2800846-2-swati.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA5MiBTYWx0ZWRfXys2BSVfe7BLt
 BUJBFFqIRnBtOjlqX8RiXlI3797gmS58jiG+9PKwKVBlWbyBUD6jDwhmDADljW+2uAC1ggINplC
 K3xb7eyNJ3OGjrrgz3BsCpdyoc/5dIMuGqtDp9bM95RT89bZf+jCEIVm3hYKdjZ63FE77SjJ8yH
 FHOiQ9OaziAP6vVn8ngnL0RNM8Gg7dkJGtRvzS5ndIFGx6nN/s1goKdx9WL1BbniJv0eMuFJ16R
 CiZVL5mq64hjgYYG3/ixNusE+1HAX7b4mvyhNivbXpmAKRXV8aNNNu1nha7QADq8Ed5yGiaTykU
 Y1rYNlZet2OYq7fCC5Cu55BnIFe6dEd61JmiE4K2cr/8ZFaYcfL3pFfEqiq9KeRjQBfUqynM+aH
 NgJtnKoq5Pu2DebfiFtaq9DbOB5WOwhqpiTEb3xHEkPtZaegpJ43+SX1h/+Zre12BHiUBbRMTs+
 /S/AeQnGWqjb8X1DQjA==
X-Proofpoint-GUID: iK6QMleioYu3FygC9LkHGUuySq2HsMTB
X-Authority-Analysis: v=2.4 cv=Y6j1cxeN c=1 sm=1 tr=0 ts=698dc479 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=7TEMZJoKV-mg7SLoydcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: iK6QMleioYu3FygC9LkHGUuySq2HsMTB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92694-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 402E112D57D
X-Rspamd-Action: no action

On 2/10/26 1:53 PM, Swati Agarwal wrote:
> Enable PCA9538 expander as interrupt controller on Lemans EVK and configure
> the corresponding TLMM pins via pinctrl to operate as GPIO inputs with
> internal pull-ups.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

