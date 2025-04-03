Return-Path: <linux-arm-msm+bounces-53124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32568A7A7D8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 18:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 722F71892B99
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 16:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD47E2512C7;
	Thu,  3 Apr 2025 16:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbiyfj7F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66582512CC
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 16:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743697342; cv=none; b=qLT+GZOiIbX3ww2+VGrTpWpbkB2A6cP07ZWzMLJ05V6NIjgdEkEBiNuSq8cYV/UIxI7ubw0Sr8LeZLVXLa+4qIGLdiHD8tRbFNykkbMpuxDHlqBAzDPpqNxQRX1sYO48jgbLC3zHQJmL8HWdr8qAY7B8B3NDfK11IW4Poz3ch8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743697342; c=relaxed/simple;
	bh=Idn2TfVzRRLn92uPIS/0vao33NCByC0CnVRf/UX/0js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkutpqSMnqkADQ0cxbgF6xksAI+JrdfTbp9EBBXY+dhTZEx5yjKw6Oqm8N4eFcazwGXab0WdiiJpPjFNx3Twu9MFkAJgy+B6LJylzo3w3UJLIwTOEebB4notCYbhDu6tZIxZCM73ZZTDij4aQgmqzxF/WrL38jB75fs5lhBGZY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbiyfj7F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533FVDbj018222
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Apr 2025 16:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a4ZiUBpEMErH6vhZC0bvf+Nx
	MJ405qBza7xtHCdCF6A=; b=kbiyfj7FxcvZVRDu1TkF4gr23XPokr0wJ7bZDwRo
	65aaP7zPnU1u3Rkz+5UIaO9Z6SZ6ykx57aLPUsVLnCwsHhvrv5KXrzIrU3OnPOQM
	0mYC+EU8QdzRzzIz1A1J7oeW095AOoZMwAIlXSy9GoYjpVwHD0IKy/QIAwdvw9CD
	7NBNKOhWAXaAmn4RkYUkCDraDMYgVO/11KTXwTahZpg6PZmCqhUuss3nbaaf/4tf
	R9z/tBPZlNAldAX66qHMicJqGQ8jEdMKmc8oAmLqwvOL/wsrIpMmC/9Q8YTpYhHl
	I5tix2QCTG4xdw1se3t4xfgPI8THLTDEOJRldVd7YbMppw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sc7x2n4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 16:22:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2872e57so202525985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 09:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743697338; x=1744302138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4ZiUBpEMErH6vhZC0bvf+NxMJ405qBza7xtHCdCF6A=;
        b=LBhIKx/c2WHLCj/oTr34fLsFKiic5ya4RRrOoPdeiQoe8rwCPG+0irNf+i153KCAxe
         Up1LQIVimTx/mkZCUI50dm6w5dmtYvwhsOZiiQqv+fBghMGzZVQ+C2usLqbiyZmBhak/
         0Dx0MqZiMdURcqJ6AtZeeeA+4FO18DGdNXFuPEX6eloxBTglainrhgcsTBpq1pZXhdZd
         CbaDDWUPIa/GkIp3Z9TJ5EcflAWfHqy44otGrQDk0aan0fLw/bSWzk0l+QHmGuU1falh
         0Wp4xxzwnj2xlJN0xBvaZyrmZScA7FPiBvn3XJKhklcGM4MuedW0vsOoWP+vTWG5WNhe
         ahHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi2NYvm6LnrFMQ6BW0OxT1ikte0ChTKa24uNjy1NpBCIfmt8VZ6VlpfurOTuu6Hg60Gx7YF36doDqlwKk2@vger.kernel.org
X-Gm-Message-State: AOJu0YyKpaDpZE+Fxbjwpn228qKzQPtF8HafcJ3xvxMPiONkN89hvV9G
	836zSpc4n3TV64FvEYhDilLNerUIXd9juBN8w+A2UNeZ5VkvY8tol38ACjj+S4PGhke52Hr3PdX
	mgQZDZJ63ncVlGiVR0x4cNlW87UrxkWu4YCpS8Z48JPejI0yRcdBux+Am1CoV8n6q
X-Gm-Gg: ASbGncs6qL5Mhp31jjCi7zr26F6WsQ1xylGOu3ctXJMhTavbG5h7bAKEKjLG/h0siTX
	LoMJZ4vRApOeAo5oOCT7N0GfRzQlO4R9bWiryRxxw2boZWhad/KHSQ3GbBkclmJG+rm2WrK9xF/
	bJiOiR2y4ip30iRcJOeYM2x7H0l+WZnJeyM7tKF3tKVr4vGJDkFfmExmBzKCzucj4I2IRZbAjRu
	OXdYxjYI+YkaJ8tuz3lTzqSVbPZ5LIOBHA7l2/GbwvUSgrD/AjEU6tT7t+mjR+yTiyIX6VqtY8+
	WR+r2WRxylHUuyUxN735N5EjWfeTR0C0mqyH6TeA0+GxYLRx+WXN0z6pLKPxgpCDhegdzWFtZdO
	sZVM=
X-Received: by 2002:a05:620a:2801:b0:7c5:5003:81b0 with SMTP id af79cd13be357-7c6865ea99fmr3047301585a.23.1743697338586;
        Thu, 03 Apr 2025 09:22:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkLhLG71dtjwxNTqmaM0NknH0c5V9tBLqCnHK8weksJGXsW38VvS3W8gt0C9UKJrHhUHuRrQ==
X-Received: by 2002:a05:620a:2801:b0:7c5:5003:81b0 with SMTP id af79cd13be357-7c6865ea99fmr3047297085a.23.1743697338145;
        Thu, 03 Apr 2025 09:22:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031bcd9asm2659021fa.71.2025.04.03.09.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:22:17 -0700 (PDT)
Date: Thu, 3 Apr 2025 19:22:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Manikantan R <quic_manrav@quicinc.com>
Subject: Re: [PATCH v4 2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of
 enabling vi channels
Message-ID: <ypt3vurwlmyxkmba7lrmgcmpeszx2afbqp5hwrdwcliwcf23ik@jvg45kffehxx>
References: <20250403160209.21613-1-srinivas.kandagatla@linaro.org>
 <20250403160209.21613-3-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403160209.21613-3-srinivas.kandagatla@linaro.org>
X-Proofpoint-GUID: KO7SmsOdEpMvJVdAOqiw-FBSSWgyhFaC
X-Authority-Analysis: v=2.4 cv=XamJzJ55 c=1 sm=1 tr=0 ts=67eeb5bb cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uZvtCs0-YMtpQNQJbqIA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KO7SmsOdEpMvJVdAOqiw-FBSSWgyhFaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_07,2025-04-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=571
 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030081

On Thu, Apr 03, 2025 at 05:02:09PM +0100, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Existing code only configures one of WSA_MACRO_TX0 or WSA_MACRO_TX1
> paths eventhough we enable both of them. Fix this bug by adding proper
> checks and rearranging some of the common code to able to allow setting
> both TX0 and TX1 paths
> 
> Without this patch only one channel gets enabled in VI path instead of 2
> channels. End result would be 1 channel recording instead of 2.
> 
> Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
> Cc: stable@vger.kernel.org
> Co-developed-by: Manikantan R <quic_manrav@quicinc.com>
> Signed-off-by: Manikantan R <quic_manrav@quicinc.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/lpass-wsa-macro.c | 108 +++++++++++++++++------------
>  1 file changed, 63 insertions(+), 45 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry

