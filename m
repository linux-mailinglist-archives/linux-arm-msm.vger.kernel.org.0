Return-Path: <linux-arm-msm+bounces-115922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8NbuOQ5CRmrkMwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:48:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8106F62A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:48:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ItdqmxN4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N5sq4kxC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115922-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115922-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9077934B7DBD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7FE4C0414;
	Thu,  2 Jul 2026 09:58:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1B84C6EE4
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:58:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782986313; cv=none; b=kdTCwLZiRr6uL/ub86AKFj+e6h0d1noxnQtSMQ1JR+Qqzsqo1KVFqjNbXev7y2uVY6uKY3MOh2bRpExIwPlIYzbrrJohpePXLSMNsEtmpz0TjqaFMF+ARnzoJbxvFhrzQr/huWG2asO7ldZwxg0zCPHJBEKUoUSxm+nZYFji2D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782986313; c=relaxed/simple;
	bh=0z0VmTlpDffbSTeTh7CAA+SlXObRzIn6jI1fTJvKuhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSUJ1kncIDHV4Ewfl7qe8JDMtmRcNywN/6tHo4wNCA5cGWiJTtnrg/brcHRbhXVqd1Jd+2DcDgZy7tYY8nSNdfYgC4CCmvAjlrRhmpPem/pbwkmO7t9BS0SkiF5v/xdr89BoEpjgJubw8AFGkmgc32e8yKVwEZqf9ba44bxD4hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItdqmxN4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N5sq4kxC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628ehoe3049477
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3n/tqMXFg8NhtwicFe5DWNVRWaMKnyeWYxknUpUMFLA=; b=ItdqmxN4LfRI3RcM
	A87rK3gWhIZ4uxSvqDs/YmC2xneQvwotlg0vRUOKHaMitWD9ux2CSDDpjoml/96Z
	IFG4ZO+IWv/U6ENt+13CghZg5M/gOT+UDoFnjYwhjzoH7n4DsN68oof98mZoLEys
	WwrNI1vB+BMEWWWpcTPHusOmLxIKERAO60n1lk8DzZXGeQOoomKTZ/+uQAIfLx6G
	PbHciOIlr9HXzR8Karj2JgATHa3Ym5ZLPA977VLrLXoj7N6eD//jZguM7sas8e2U
	a962VvOnHTFh1HQBuqmTW+7pOwLwxZOXBfttJRHyJ2NX2HrtUp7ibi9oSgTQI2JU
	Tek/7w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541v406-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:58:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c08e9c344so4355301cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782986310; x=1783591110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3n/tqMXFg8NhtwicFe5DWNVRWaMKnyeWYxknUpUMFLA=;
        b=N5sq4kxCmhNfEmSmYqwnoCZElb9J73jOLyezj4Sh9TtPaPEU9WEvlbFwQuUSfHiYHw
         noyCwBedPRUm3LOp4IZT0NAFVvjszZ9VNZ0Ww1qGE2r+2wWF1Sv0Y9BEOrPpFiL2R1dC
         VnVgl9w0VAyXD/SnO2ddROpO/3Y54rI2y6OOSH0JnBBXjleMjsAE5FPykd5+Xr4dmmyw
         F1YwYsd1KEnu28/zrK6+Gcy5dEksNJcJqmfksNK9rfX9xZLBhYQSwSjSNreuR5e2l0oj
         xbQueYNWxRaC/8KdmqIMo7G9y4F6/kzRmULWNinrIaauwW0bHixGnfkM6o3SR0xSz7fe
         /3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782986310; x=1783591110;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3n/tqMXFg8NhtwicFe5DWNVRWaMKnyeWYxknUpUMFLA=;
        b=AXdqwyCRXgRvnQ1G1RrF2kWEEL+7eSi8phLuodLBt9Eyi0bBOvRlFRVeUm3QkNXopJ
         4a1d+qGw0+/2E30hxS4KDE780uPkNk1wUDEtyAOw+wUUepr0YIsrzH8ay2TmiTAHUFQq
         sasB38h2UP9oivc+ura4rXEHpnqGariwVX8DHZyNKeMpiEpRSRit1o+vw7VPkU+IqjYV
         5A7NYSWSTGCT8p8fbnfZOk3CYYKrIfnXaogqS/CBWotjt4tzyUbloUnBl2D13NpYATWd
         sP2NxsFFaYkhYrp1xrlJO8zFM9T6jO4lnMzym0yPwWv4fTntMN3K0Hney890tI1oNvPa
         h0rw==
X-Gm-Message-State: AOJu0YxLzQbBRBr7XVaaoXvA8d1WmA0/E5P/3Humoi1bYRSQnpjqXl7k
	GhOj2N9AbOzTSvr8kB2c4Tnu0iCD4SEDvtMzhGr+uTnaF9upL0GQ0WeC4Aq6OU1mSwDyZ5E/gcL
	TVMc3mEcIthXWBtW5KxjzIPeCe7BJ4LQn8tbzhiPKqf1NU448d6nyD5NFNLhIOafefBgb
X-Gm-Gg: AfdE7clFNL8zBXcnbXbtbOiy7tHnBhJMd6F67UXY5OA38kBYDPRkQ8Yvwl3oJFv0h3v
	0P0byAdcNSrYPH9e6DhLYtVZtWMOfduZyObTCTUlktKbyZsn7iRrY4TqZFLEeOSbqDX1EG7wh/d
	UnkFAgdcCrcN1ZHn87iM92fzjCal9n/bhHwLi0diL1soDtYCopGeI0eCQI00P8zbym/14cdrhHg
	0Ipaz/j9A9ecNNoPvUACzGX7CsMTWpHVQg4LQvRYH2pHlewu/8J4t1e60B2O/7vm3Pvueb//1KM
	tmB0PCULlRv4TJNpbeO0Dh835K4OBT8a8pxWha0omc5TnznTSDlrG1dL6bqR0qt78bOPm+Gg9Pc
	eScgRvvq/lQsCsIvXsT46mlAE5EZCTUAm7KM=
X-Received: by 2002:ac8:7d83:0:b0:50b:2875:5782 with SMTP id d75a77b69052e-51c26b03d36mr50584241cf.6.1782986310081;
        Thu, 02 Jul 2026 02:58:30 -0700 (PDT)
X-Received: by 2002:ac8:7d83:0:b0:50b:2875:5782 with SMTP id d75a77b69052e-51c26b03d36mr50584041cf.6.1782986309610;
        Thu, 02 Jul 2026 02:58:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628efefsm103164566b.32.2026.07.02.02.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:58:28 -0700 (PDT)
Message-ID: <356df014-62ae-42b1-9745-673db02abcc9@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 11:58:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] firmware: qcom: scm: introduce qcom_scm_clk class for
 clock management
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
 <20260701-qcom-scm-code-shrink-v1-3-02f5ce02c95a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-qcom-scm-code-shrink-v1-3-02f5ce02c95a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wunbC52EXgSr0PtV6gwV2HkfjS7oCsVg
X-Proofpoint-ORIG-GUID: wunbC52EXgSr0PtV6gwV2HkfjS7oCsVg
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a463646 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UWT-nxUxJpYvPzTNZu4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMyBTYWx0ZWRfX2kUD4Jzd4Y2z
 HMQHXX9NDNhdZVGTX8b6PfJd7jLFJ2PxvT+k4n8Y+6NyyiAXrdTpBM6zYGJdD4YRIM+ukFyqY8r
 XCJ5zNA5gOEc3khY1DKsuMUQESgMD7tOVbCAPMm45SxgEqYkf8oF70xzvRjFTdw0lAKzsCCH/3P
 cOHgAvKgyxYWHTbM5G24okgov2RyCkhoIKnfRcmzsGl2H4bUr1YBBFlLPllgKIdGRsggSAnvblb
 +SxuJAn/BX798Vs6VzJtkNhUn2iajNlEkYOh5socP42B1biBiq9x/JHjJDvyJHfPjm2RM+Eh9e9
 6vTJsJ42jCkM+MTH6c8AnDc9CarYLgexg+kWWQXCNjWcfW/XAkb+ckPWljJFA3GvnctgUQdrA93
 Z674v3j7gHM/I+yC7V45ZXdPGn37MPlklCAvlV+PgrugUHE5vADyGQIGP42H19RlhJHZYaQnYzs
 GB7LSmHsWAdVCGXHGBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMyBTYWx0ZWRfX6Ivd/n1Cf0xe
 xirvDJRIMS+LkY+JHAw/OKwcG5SkW7hRlEEN6/JxNKjw/mHbKs3YOrqA3TRqz+vqmHe/6K9/58t
 lzftP6jfXd08Wxuq0oDM3uilK4CCyjo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115922-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C8106F62A4

On 7/1/26 3:38 PM, Bartosz Golaszewski wrote:
> Define DEFINE_CLASS(qcom_scm_clk) that calls qcom_scm_clk_enable() on
> construction and automatically calls qcom_scm_clk_disable() at scope exit
> *if* the enable succeeded.
> 
> This allows us to convert all call sites to using
> CLASS(qcom_scm_clk, clk)() instead of the manual enable/check/disable
> pattern and to remove the associated goto labels.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

