Return-Path: <linux-arm-msm+bounces-96643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCh5JAIusGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:43:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FE42524C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7247E326D3B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1F6296BAF;
	Tue, 10 Mar 2026 12:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KzpBwv46";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kn2e9EpQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF13387590
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147112; cv=none; b=CgDJHHClIeMXg1q3zbLA/jRZ5jNbAd+oJ0V5Dv6aH8+wopyTx5izbG5v/CVxzR8QVjQfNx79AED8W7DyCfPlEtZXxoZCRqF+K1Vl/4yGqLjZoUB6G7kU46iBxfvOzmmWt5KdunAzgFCjLiTpcP2uLTEzOfasLOF/wTR9sj+RiLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147112; c=relaxed/simple;
	bh=DMrGlcUZS4sJlpuwMxMjZUjxwr9dDsX4Ujk0GKVtZcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRcDXUYkbfK9REnuZ59G30n++/+jGHjEcBZUIAf5LlzutU/3NQJTtAOkLDMi/faqLyv4Kyu6kMHCf2jmcaoqeobD2COXOhns7XEVw1fSCqElHlhXkoEwsqmRz4QSo2ME4rtJwDwlOV4ql+Ge8d+ZJsNioOVki9EUwzq4H60b3Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KzpBwv46; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kn2e9EpQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaUnJ1647120
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	turRhlIzyD93vEE3OwxiOY2bQ1Uk/jdC9mOp2Vqa0lw=; b=KzpBwv46LZS83qJp
	TENrTtUWhJHwIQWvAISim2rH0UvLVdI0BZP4buWK9oC59HSCDSvvnTPD0GPDULpU
	7zY/UF2HPAOwW2ou7sDx9xpG0BGbq4+d3o4FExcG49V5Xfq3BgY+3F8vDatxNoAq
	QDOZeY077tkyFf8GN5OyTxd1UO8jhpLYzGTiDdVZQTP5HqwmeWKKk2jNRMKonVHu
	bqPum2UHDT9M+4RjYbdARLCpC0jIcam9Uszz/7y4ocHKV0pipy1zIDdfc7iAf2tH
	Y9Rc2tzvnPB1DwI+zqWVZV5K0ajPqKZtTStjPaA4W0C7xSQphyyHtdBme9vpvkdY
	xTUi0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8802hht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:51:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb39de5c54so831817785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773147110; x=1773751910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=turRhlIzyD93vEE3OwxiOY2bQ1Uk/jdC9mOp2Vqa0lw=;
        b=Kn2e9EpQ1O+7h5PrtIVFVNu/iIwG+D261ejeFcJfro5lux/w+5XoCDu/XcFeM1fNVr
         ZrbeD861VH80PRw9GIdonPerqqCLf4lsgDQev4pOL16Qpil7+fqtdi95u5foBk09ygs0
         JkONrpagDcoJvf4BwciwAC0V7LSN23kFnMfcR1OHRrWM8XK1wVFepZPI3xdsToAi60TC
         msRIibxZvszCnVgj8ePGnTsSjp5L/5/+5EBsChdWQ1vYLWYsbwPo+GWmW/LYhdtBv/IV
         B/DlvSSO76UXQPviT+q5zzMwreXnB9aETeI9zywvXkOb7Zubg5a/rDkYrs6V0fuX07hB
         sMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147110; x=1773751910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=turRhlIzyD93vEE3OwxiOY2bQ1Uk/jdC9mOp2Vqa0lw=;
        b=ajTPbEmnj6Y8lG5ydkwZ2XhaMzWRDCScQng++vcGr2HKbl1BACWeNTVwnhRVmkCz74
         8zZRJjc0O6qyudzwGrf0TOM9OioYKd73AQzAKRfpH9gGB/Exh3NJETq81QcUftdGLc/C
         N5wnqlf00+/ARDUd5AnKfn/od8c7TqjJmhpP2stp3aYXLn7FsRM8jERQ0sAwyvvIAdLO
         Ty43cElp9HGezyqPtAdCiarpkW+EFsJe5765+5OeVvRsRFMXKaUMsV2OSPxfUPktDB1D
         f4DRTPZ85UkjCdpk6WqxT7CeylLdhyTpfxtePpXQkzC/dRNhMuDPYFIx6RNCxlKb5d56
         PufQ==
X-Gm-Message-State: AOJu0YzMfEQfngRLoKWZX0MxVna9Ex4L81iTxFXvSJFOiXaRBacbJqZg
	UnZoVzRorGujfIcv1T40KCTLEBoZaYTDBDVa590zDdjaInnJadb233SDZtdushhLm6Ku21DEFOQ
	rrTnaM6OvUF1ojPqVT5X2qHLwc5Pd/9zLIc3YjgGcQ5cueS8esYFvMzd10kZ7KHVaBZFV
X-Gm-Gg: ATEYQzy1FTIro3HgWnIFS0pDKt2bnmlptkrTbI8kOycSx9VEE/vAea0Oj+0iJ5ZwtzO
	qtABh2S3CV1kbnnmXSnsJlS/uD4UAJinx1ia0s4ZL8hdFa+VomNJrMmt71omPa8n0Jcy7cy2VIp
	2k0XGtLN0XgWug9sTmuvKtE5JkmdCoL0DBlSNf9UDwUHABTaeaNF7+jLO2MQDrUkUcrIOED8xOV
	Hhb0swNnsM/KfPkMduo3CCb5iQdKjqVvPq0VQzDBUo2c2pMkmoifGplXAydVqgBzvxnIp8e3yeO
	jZ9QnD+rV71VCKirG9KvQSwUP0oR/pRiAZqtLc/2caxy3DYxQXLXIAalLpp/qT9qUnNEONLydS5
	CDkvlY98WG5eQ/xRrKYOIJ2IR5Da6tL9LXuiVqLjUTsrK/kVznA6yzi9QfrBq5mtDoQu6HwjUgo
	v4nGs=
X-Received: by 2002:a05:620a:472c:b0:8cd:86a2:340c with SMTP id af79cd13be357-8cd86a23a09mr726892585a.1.1773147110211;
        Tue, 10 Mar 2026 05:51:50 -0700 (PDT)
X-Received: by 2002:a05:620a:472c:b0:8cd:86a2:340c with SMTP id af79cd13be357-8cd86a23a09mr726890185a.1.1773147109815;
        Tue, 10 Mar 2026 05:51:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef42a24sm490903166b.8.2026.03.10.05.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:51:48 -0700 (PDT)
Message-ID: <4eef2f6a-95a7-4717-b0e8-a8698045c217@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:51:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] soc: qcom: ubwc: define helper for MDSS and Adreno
 drivers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
 <20260306-ubwc-rework-v1-3-9cfdff12f2bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-3-9cfdff12f2bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExMiBTYWx0ZWRfX03HgWlbdyXtM
 kktS+ZXSYl12SrocetiLsusg1Hbkv1Uwu7N7NZmvyi8saGHbhe6LUVG1XgswrUyQpDd0RJ74Twd
 eiV5jpGkE5UIUi9G3HnlJ5pmPvWPg34TPaG0RZYk2Q9ZYpxPAUNXto2Q/7VRVldgoVJGwa7gySd
 PrehlgT4/8Y33hgszl5NpZsdLgGSs1fipz6kmggJpZ6zZtCaN8wKhsqJWXvFMQNZAHN7KK7kHtH
 b//0qP//JGmToc8d6bFKbbeK+LGJaqPmLyxGSjWdNp5E1t4/aktfPxm21fhXL6U//lGaOWcLzCo
 AX/QtW8JLOoocYbZnNJt4P/++ZjykZ1ayRe2o+DCgnLGbJtLntiYPEK3qflUppsIjPYvr4eQK83
 iMNZ8003Wi+R7G6VHkZ1XkJJSFatKchI4OXCem33z23Gf3BaDpRT2IF5L/Ut6dcWMldcGYTJNhC
 7qKEmUFyei6R90eMjZA==
X-Proofpoint-GUID: a0uWoBxDELFDCD6AK0MU2V32IPaS9e4w
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69b013e7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FoSyCDDHJe3iGoLm4rcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: a0uWoBxDELFDCD6AK0MU2V32IPaS9e4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100112
X-Rspamd-Queue-Id: A2FE42524C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96643-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/26 5:47 PM, Dmitry Baryshkov wrote:
> Define special helper returning version setting for MDSS and A8xx
> drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

