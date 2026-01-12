Return-Path: <linux-arm-msm+bounces-88547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E83D12379
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 12:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67911301E5BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0640B3218DD;
	Mon, 12 Jan 2026 11:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zs9Q0Gx4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AyLip8Ky"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156FC33066A
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216422; cv=none; b=KLmaZtSm2yOnjt5cBqkmIMLKTeVGr4gEgXTDhep8YWNL59QMOtnw6ACChx3j4tnmpCNVJcsEf28SxcIZihijai2BRkpMTCXU7A4a7kdyNlg2in1pfQCDlwFNczRSuJcOkSZg8UNIn+2jHnR4+lQl4p8MIoAHLakA12zWtru1FAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216422; c=relaxed/simple;
	bh=IGHRrX8DW1rlODPmXhrgcnaT/Ed/upUX6PHNB2rA8wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TepW6QjAoRKUFcekXXGGBziPygWDdDyoS8GH1dJeVEqB+X+fwyHhvIDIs8BegRr/H/36B5pu+0EWHjQyoQtEmltImkU3DHmDsSP8cY2RjTVjxFOutmeyc9LQtFe6sYYn9bNIa097Uc8x5QV2AMXq1csuKfjhRqyp4HSDb+nmyfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zs9Q0Gx4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AyLip8Ky; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7Oia9555435
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGfsPVvvhh7LOlXfOlIDcnSnJVDnYtJjxSxs14patX8=; b=Zs9Q0Gx43hQzVPST
	wQ0Or3nfzR9h53wQLccmQpCnicT+Ddipc/dqcC/2MmAvgzmV7xWvzK67oQcP1b2U
	Aphv+OFFG6w/oY7XftuOvSCtyAp93HtddQLTumikZGvlyyouDbLz437aN9Jo8ooP
	UyyY1iSxyWlSe13YhTweoMEzyyEQ9RWoogDWfAWeDdfxiPspsqIYs0qP7D5nP8GY
	6TQ/zTpcPwZDCb5NmObSB0x1YTG1wdNbAJCXphD023tWl+fStet+2jSczb6T3w91
	8r9Rvr1QyC8oc6dVS19obRsUu1A5Z9Rk4F6XXe83SLTkoz6qSXSnm+KW1BdpQ7F9
	1dne6g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw0rh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:13:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f3564e2321so11817531cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768216419; x=1768821219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hGfsPVvvhh7LOlXfOlIDcnSnJVDnYtJjxSxs14patX8=;
        b=AyLip8KysBU9Pd7dLwj6OmICzNOXyv+tSTeS0lPnh0zaCyrA8514eVQQuzyJviz/Zc
         Xdn5nZfq8+3OEpIGqGdlSRaZE49JQEmb00CocEcpr8xkJjuETFWt8HuuEE2cSq4Skep9
         A3UWWQLMp7TIzN9IpoTtl9i7AcZApuPhMfossr/Q5ew+CmAM1kmt2lYBgIqQt//TnPMb
         WmPumA+6CyDIZZjD+sc7HVy1vRKpfxkEcJl2gbLC8mUfWO5lK7ZIl37DNRO6ggQqkGp4
         WiOtkH0bDi2EW9CTwSfEfq1tuiD5Jo1csG4YRMZCFv10DHH5I1LsClhZ4ta/rTtgq+Bd
         yIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216419; x=1768821219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGfsPVvvhh7LOlXfOlIDcnSnJVDnYtJjxSxs14patX8=;
        b=mAwQAW2cLdBt5n4ByIbD8i8ju2W9MLKNlEbQIPyjOVeE2UPuy+/eHLMhqzUzj2Sp3A
         hnb7EJqUJ7u6sOMUzUrslrX8IJgNky98EfFA4qjt37ngKtW09lhrNilfgXEl5jcXeJMz
         xnyCQqa6+R2aSuGnUXSrtMlDA5JvDCRw3kDqgCTX+stkDVuafMlq+vpeKgNeoWV2hRBd
         or2f6ZeEUogTgThhjB/O2uAUgQVm/DhZ2RMBEHea3ndFr/w7cE/FC4aXTx+sI3au7MiA
         j1ImE5bJI8vl9xX4Vfi8fv+f8RDelTAXDaldkdNwMC0T7ndZ2XCqvhRh2dKmQfukIlWm
         FTuQ==
X-Gm-Message-State: AOJu0Yz8wejLaR3OlkD0rDvUM8FqI6eSOL3JS3zAKjSn5q6BWMz3ZGFx
	MCCp06/q2AoNwM0+MKjn1Z9uSH6U2yehYWOk3gcCiEcf7k+M+Njw5N8Pv2p+wMR78lQqJ6IdLYB
	A9zMcHbK1pHGtrQHx01yD22BUF4Df0gnan1uq55Csf18ilXTp7g0eXBgkogHMyuAwWlsS
X-Gm-Gg: AY/fxX66BIMCYHKDqdaj8hkyvbCyYI2wbvrDhBr8hc6qNhRjX4QZvlx3m7gjMaE2q9C
	TtdE4Yhs8Ov8vhBzVhaCyX/EfKV5xBH/W6v8T01K0ijDhAJwBb+NLla3wzu0FQrxdDXTf3J3VhW
	rpgPjE1LlKP+jGEcHKWwIEf+DwZBtHCOzQ1obKh4BTqW7J9MI2TQfifogm94ZG8iQgHmAAUtPcD
	UOhkb28kKvDSex5gSnd9g0LTpO2ymDs0Qm3ek4iqe6lLl1Tc7T6bTmLNifmSH7cgPB7oDjAQxGa
	8uQcHSyM+I+EZYo5A/Sp3Ig3oPJXWPT24W3xcIAiZDKdPBPgk7yi94RWL2y6EBPMVQTS8/yeg5L
	Ra4PMyPCwIRThUFukrLs+rJOe7ONrMBrwj+qEnk7HDsWN7BcHPk14eSbKz7eeKyqUP3s=
X-Received: by 2002:a05:622a:1890:b0:4ec:eec8:e9cb with SMTP id d75a77b69052e-4ffb49f6842mr188523431cf.7.1768216418932;
        Mon, 12 Jan 2026 03:13:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9XmynZpwldVTRCqPhkNbOHliThh9mauWAEO1byKEo0sIHT3QslJYL7Iego1JEJG8IF9M62g==
X-Received: by 2002:a05:622a:1890:b0:4ec:eec8:e9cb with SMTP id d75a77b69052e-4ffb49f6842mr188523191cf.7.1768216418480;
        Mon, 12 Jan 2026 03:13:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be658b3sm17106912a12.18.2026.01.12.03.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:13:38 -0800 (PST)
Message-ID: <62303d85-97ad-439d-bff5-ce113b7d29b0@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:13:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: dispcc-glymur: use RCG2 ops for DPTX1 AUX
 clock source
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
 <20260112-dp-aux-clks-v1-1-456b0c11b069@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112-dp-aux-clks-v1-1-456b0c11b069@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OSBTYWx0ZWRfX+hzRDX51m3ra
 LIMZt+qhzY36PZwOZbMqwSR/w04TS0TPGpCELbMN9kqQKcRJxiCDiF4zZcH3XFYyFo/K+eU/jq2
 wxElm0khkOuRwGXWyozyLlbdvbPJSzh7U0+XjBmgHnM7ul7qJvraid0v243C0902vjJyn2CRsV9
 C6XEinhfY15kUAkFBMvo6nuwhGVcONpu6XOijnAGaHcJtOm5qUKrU1Zkt9MmNyqml/EibXAMQbD
 kj4/ZjFCv2rPrTuYL4JUCcyJSK5OErhO4I9/iXU1gQb7CB/h8VcmAAN56Js8ol9bCFTCREHJCMA
 TKyiTLKni/hVfWCxoZxdB1mukuNhR7J/J1nRcpEDzg0QM1jXUA8+KgDmsckTK5kNHADMFVx/hG+
 F5QBd7ttWOBlMF/vGXd3vNeZoNFQmYRz3DBjnG5HaxGQNlfmwg7voWqHY9j0t4lo9vJ+AuUWm5Y
 DpMvSPoSgB6azRBP25g==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964d763 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UIqvOZ8aP2BlQGmZcB0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 17DsG57IC6Zv_z5ijINLkt0iFK-k1dXJ
X-Proofpoint-ORIG-GUID: 17DsG57IC6Zv_z5ijINLkt0iFK-k1dXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120089

On 1/12/26 3:12 AM, Dmitry Baryshkov wrote:
> The clk_dp_ops are supposed to be used for DP-related clocks with a
> proper MND divier. Use shared RCG2 ops for dptx1_aux_clk_src, the same
> as all other DPTX AUX clocks in this driver.
> 
> Fixes: b4d15211c408 ("clk: qcom: dispcc-glymur: Add support for Display Clock Controller")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


