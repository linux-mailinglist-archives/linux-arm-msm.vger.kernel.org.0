Return-Path: <linux-arm-msm+bounces-108153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FM+OYvqCmqR9QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:31:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C3156AC10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66D093010150
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E613C3EBF14;
	Mon, 18 May 2026 10:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyqvYYqr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZqjo5yU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8183E928B
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100148; cv=none; b=Fbicz6j/PL5vKWUDAaPKkQcNrZXA1CBLXnslTu87985XZ7Ss7u4l3kYvjuLLAsNPCriyuPR4oiG1UOo5qWRxEoFhGMGIQzKK4xLUoxYemYqLD1WHmc/kUfOw+ZlDoCMJ7t64Cms4QOR17xG4C0BSFHDn3IWfGiAHzFrZkko3+PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100148; c=relaxed/simple;
	bh=LeXd41lZboq50qnzCjlZvrbX1RF93TDpY63Fs+E31Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yju9THUZJ3IlDiPekRRhYlM9Sm57OqLbbxa4QyPGuDY0QAONYwoU8qfGOWAXk5spxpEvpSkGfbenGiXa0RIqBp+x19pburWo7uqoVX1iGSRcLTPFy95mqdil6igAkl8Ox4EONPeVTkvEJ2c17zxfuO7bZ7mFOQnSuwbNx2Cakrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyqvYYqr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZqjo5yU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAP3oI3237809
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iDIDgCmo1MFgZ5mlJSK1d4nK
	X6DmCBRe6ltwAExOghA=; b=QyqvYYqr1C15HhRFWXI+D6/URTHlG0bg6mX9u3Ju
	H1xdstbYVayNLvtbG/Wnp+LneRq2Qpa+w4feg6pTWUS6FFbr3i8wVB7zVCbji83e
	WmBkvVaEJYwzgw3t4mOyNo4tmw21XWMHTJcTwd8vtkiCQOM8ci6bKQCPQ7aQpTgO
	8eqON7IjuhEV+NLoZ5LfCuojifSUUJoB/pe7/MEsCVWK2HIVFHcM2sTPAs2/gC9k
	MEzJKh+/fUDblDigqzg1jBc9HecfSOJs7PjKThr5nTJXp/aDIiJd1UkX7AGBaTWE
	kBk5CvXfQvc8RzwmvyUky+IYHRHMSChuj9V+S7B01f8sYg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqx1pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:29:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516458449d4so25952031cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 03:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779100142; x=1779704942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iDIDgCmo1MFgZ5mlJSK1d4nKX6DmCBRe6ltwAExOghA=;
        b=cZqjo5yUc16FGcte2IvWu4RibpVgQqIcr1GN+Fe1XfNU0rIBj+/ezE+y6N2OhdWja2
         koPVtZn0gYqSwqKyhv17BSENPn8IA55/Y/J6Nw+Y2yp5rAqYtOqZMhrE0J9uHVetqRl1
         85M3PBDoj2EKBl2WLw2Yh1BKhCHesxydw8LWx2Dl+gG6O47Wmpkk4WGWyFx9lnynRrUq
         //UMI3iUAxsEJhh7njPCTcIsmSkCrkf/39y+No9/GpZIeySlhje8FDrhX2GvdyWSZL9p
         QQosdXAXxzLoxU4tZQys6bGEta/mDp9ztKcXHePKEvYuqjTbd8ThuDeG9rSntyrUjYd+
         3ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100142; x=1779704942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDIDgCmo1MFgZ5mlJSK1d4nKX6DmCBRe6ltwAExOghA=;
        b=TCKPWtkQTjPxC7mbcKM+Od+qPwnfzOxgCvM4rqevOJoYDIsuX2cvZ/JYab1snCvbnZ
         hdVNHNStMVHyajyiAvXIO2r0BDI0ABjknGIeWn0gfc37XlbAel99kvhZlyvDNU25+ibi
         +H2UIzBFbnu/9pxkBPQsfCXU0tzHz8DhMNZo2/W43+0RDV1/HuUkWnN+jRpTVTdtHea6
         LkxyvNKjVMbs5X/FwhLlWbqmlPbLSS/dHqo3e7wd2sNltx2zOJt+l5xeMMd/2C1MdZcd
         49s/jlyUuB3s/v5s5Y+sJHzkyVA+CUsO8rlWzAT3OUHBcXTW9Ru1n40CVAIlM8SHwE+p
         YPlw==
X-Forwarded-Encrypted: i=1; AFNElJ/R1aG82mcIN9/cTSJohDFdYMt0nbFZKNAqgi4Cy09+x1RUnWFuyGDvzp47/pZWiV4IChe5v41zuHa2IQbe@vger.kernel.org
X-Gm-Message-State: AOJu0YxVcRjAdMhpc8csDFSlMoi42q2AVipEfG92ZcqASc3REQtYwTIz
	DdnZbOmYYQ00H7/5xLJaJe/zY9xPs+Tn/b3BIVI06AjeaIntwwQS/RUg0kkqARCY+5PuKlLpwCI
	PTC5SS5BHNE4Bz/sbIOWtDRUPYgGOE1pkEwzWjxQuZM0bFh4K+LojKU9MbMiSGqa39NGO
X-Gm-Gg: Acq92OFxgigDKLyOLFC8Z0DHWunshs+SdQOvnpGBZDuCsyaUGEe4IkaikJtPr1DtFNy
	rLeFXQbug3fJgMFqlO/5W8qdZ+a0EaqYhMsz/AQz/t19r4QJ0p/0S4rIPcBrvAJTajSjRCFWfHA
	cnpBHZKgwSJ5CohZVcXgq7TQYRJthE7yZqxkcsdl8jI1ySV8bU6rHoZlfLEyF+tknBIDdIGwrZb
	zboMoShkN7qILmsuog4XhlYo3bLbysrk3ND6lULAcAJyRSrruu3QqJZ2lKJoHM4UUQyfuRP2DE1
	ttvLbf7SIlDFcc3Gy33GBmwkUMKM4GK2t+UVn5W5miT/xcggAns3BvlkE6Ojh7iHeXulC05JjZ5
	gxmph8gx5fmyIvoZxkmQ2iRv52p0UtK4V2JY=
X-Received: by 2002:a05:622a:5513:b0:50d:6557:5c8f with SMTP id d75a77b69052e-5165a256f60mr202989471cf.58.1779100142088;
        Mon, 18 May 2026 03:29:02 -0700 (PDT)
X-Received: by 2002:a05:622a:5513:b0:50d:6557:5c8f with SMTP id d75a77b69052e-5165a256f60mr202989261cf.58.1779100141504;
        Mon, 18 May 2026 03:29:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm35618279f8f.5.2026.05.18.03.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:29:00 -0700 (PDT)
Date: Mon, 18 May 2026 13:28:59 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Fix clocks for HSPHYs
Message-ID: <vvqddmzhrcqgn7i2g2npfrcccbb5bxnhj7okvjli7u2n4onrz2@jxsqz3tycf3l>
References: <20260518-topic-hamoa_hsphy_clk-v1-1-d85203756505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-topic-hamoa_hsphy_clk-v1-1-d85203756505@oss.qualcomm.com>
X-Proofpoint-GUID: MGe5F1X7DAQlD8MDmE8_uC3QgPEYKYgq
X-Proofpoint-ORIG-GUID: MGe5F1X7DAQlD8MDmE8_uC3QgPEYKYgq
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0ae9ee cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ctQbN4LTtlHq6RIfZ_AA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMSBTYWx0ZWRfX09bK8HIRONdJ
 X2G/1mBYsbThYHNyRyYd0RqZlYS/OuPgdxplyfPSRL9LhhU2ylLbgTK2h7s+udZLHM3Nc4EiZ9r
 oBp/SOAICl5bxbvrjIKf2mWSwGRZEhpSM/86zsknhRU5IdwWrVRgEXWwyyCOQN7I8GN5Wy5xlfT
 nSRw9Q1wdQVn1uv3Gs4jC6bC/vzJhhalrerrt+kNLsUupLhPGzVEexPtcyd8phG8VgvR6ydmVkn
 ZW0gLplOdyh+nls25+zjlgWlYuIptPcuPkg1mSfxaEXcqiFOrlqPRZ+/0mPs95GfiBNYnq82o5n
 /0e72TDXC8i+fgKBfPRbm0kdOfqYFPepZDJVtIUZmll/0vrQRMSIdeEzu6SCLl/uOBtIXbKd3uq
 9AojlVI9dksB8CptnPszDRvDxr8E9xQNMZuoHYRLeZcm58Sf7GvOlkiwhZYgvObYhCJ7N+n65r9
 HhfFOv8Q6znGduEW+0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180101
X-Rspamd-Queue-Id: 51C3156AC10
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108153-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-05-18 11:54:39, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The tertiary controller's HSPHY has its own toggle in TCSR, while the
> primary one is wired directly to the XO clock. Fix that.
> 
> Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

