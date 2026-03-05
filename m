Return-Path: <linux-arm-msm+bounces-95583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHKVJFtWqWli5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:09:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E575020F6EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC2FD3019060
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7744119DFAB;
	Thu,  5 Mar 2026 10:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jbqng5yY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPMVF197"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0124637C914
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705200; cv=none; b=hx9c1j2c4j/kr8nB7gBJg7yq6kqHITkXYHO+1kWWdyHcsW1gFUxiz2lzYMa32AxbTGPH+X0vQx54nxTDPK/jC0gYF4cO8+4mhch0D5Et9y67yneElx6XcTt/6QuX6MGZccofvziWrDj2lvbSgqiOxvvYQMDrPThDYS2vclJkCz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705200; c=relaxed/simple;
	bh=geYlLSGbi2ubWNM3icP3wHbx1TruJTxDtOkQ1XJIM6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d1jlMWTmV6BMgLEA6phu2d35rjW2Bhdph4l4E3NDndA0awwcIgzevBEK5k0/yWCPStsOCulBkQc4UIj6Tpt9ZnPytFfhvfLnuECeYwrtBbvaXhhYSpzD7ccEvtYps4ujlmAi+k7FFsem2EIKYFOsSTtLiv6ymrGbKEXbuzIqd44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jbqng5yY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPMVF197; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6259C3p83665284
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 10:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aH+1VH/Xv9GKxmfwG+hdhM3wTHJXfgKYGbIbiNxfOq8=; b=Jbqng5yYpTNQh+St
	8VmZoS+s5K7E6DPwB7WPpSs3t857DR7g3RR2nlF+OP3G59WNF0CjYwEAFR2OelIv
	bT9oyImelULQ4TkFGVF0Lvlotkg14b4AYrocYDdzIZs+E558njcBBlHexXS294Uf
	3jXRAEp9bPmJq8jkd6k7ZdPvvOyhFSu2wX937Qgo/yPXvc22F1XylocKttf4iJu6
	B0ZCf1OZ6maJtGhJ++cp/gSP+fAPrCWZImH11H9M41wVj2Wgy1BohOc2Fj4CFt12
	i2W+TynPV+LNp761eUqFc904EvrY1iQ5p/no7z4i689Ts91hVC+Mp8t0DVz1iDaz
	jgDL7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq04u1k94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 10:06:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb45a6b860so452848185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 02:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772705196; x=1773309996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aH+1VH/Xv9GKxmfwG+hdhM3wTHJXfgKYGbIbiNxfOq8=;
        b=SPMVF197MEH9d+mB85CljJxq+afLfPFkG5CAWrk80ZwosW1rkXeMaKUw70cdcYEcrV
         3tn16a5SPRGpowUroSKYAyohnefdstgVcwJebpW6yzjgfGxtZz5r6VQ+j90xSkU1vmLB
         vijy3UKRw1/M9Ohe78/tY8fuN321HBxyMCIOIgT74rWaLqp8vWUNv9bBTJLML3st6NxT
         xFwe6RL2mz98Csckr4bwEv5bBKNFKZoQOvhw1Jg1araK559E9vBAMPgkVexaFCt4KnyR
         qFY0xTm5aysQT5jXClsVw5Ij1gMQl0P13hZAO4cNlPAOTPGyNKeJd5IjSwicNPUvqA2y
         ajUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772705196; x=1773309996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aH+1VH/Xv9GKxmfwG+hdhM3wTHJXfgKYGbIbiNxfOq8=;
        b=Otkjap3pkKgLEmBFDl1TOiY+vaPPM49DkwTjzhoyEpEyuZh6ovxTURFdenEkwPdPYd
         LCEUSbkWIv6wetfZh+eMD1VTa9Qki1rOECFnfZOwtV0OjIG83LU9g3mnp0pB4CARw5D/
         S/G0oq1emlXYo5R8QwIcs3hOzQPw3hN4oKjqO+8T8yo9dbXgCkKpJGwK0ec9gQLbSXSa
         vfiCjV85ibO7LBnYZbH/d3POOMJDzlmUMxIhFl1g9dlXNM4NPOi212hKuwtnUWyu1zdJ
         y1sutggDuYnrzXR1t6p0HDUy0UU3AFQsjU9fiBIQi85SpfIyVFafP1EYnCRFpNG8Nv5t
         Nv1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJnLARDTObrdw32J2Bamp6OCmE8TFtuiqMvYvYEQaaJLOhWGt/ZzHYod8Jp/uTHkHNuewDzcr/mMG0GUYQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyA0QCFOce4S2BDYHOhY3eMv1h+8v4Mi7IjFEMnIZHzB2tG1ypm
	7NTzW2t7/lsj8aGrmfBIuPWBJ7cmdXMvI+2Oti+qJKRjefYUCqpbljuasXoozAlG7yYOjvQrE5A
	KEdMoMEWddSph0IAY8fFrUy3OAYs4xVwwe+Xt8MMdKbOQPItWavQryZVXNA7N4cn4bHE9iXDIKZ
	qH
X-Gm-Gg: ATEYQzyoIGTyD2JYOA5FNW4/R+MZBtGU9rSWUM4wqQK9ha8ZVnxnBF3QFYhk9/gc2U6
	QRG1fSQQJxeBcx0tNLGLnhzrV96/k6j3j6zk7l7Xo04f1tVu9uSl+KzWN+QlrtZ6hP8YZBYSytS
	ciQngK//QSZdPlfdSME1iCuI+pDqq54zRhYDEawSgvePo0SR0ZN8cRuiNv8xIN8Bjf5ZxrGOI4P
	amQY2PkbdPhedBMKtVXJSLcjjNdXGoouYpCcxj1TkySrkfxDndNoP/jE/u3aUyLHFqlYk/v93Uc
	pABIo/tMaLNBJkxJxezyGWb3ROTVmKPJtFoz0AjCHi2zfZK6pNwpJpJH3mluKc65yTMzs0uLNfD
	wFGniGrRnNwQnQHqYlkmPxQD1ASmQCA8duEdYNknklydBT68Facf7bSoygClQJyyoJa+dJCbREu
	xwFnA=
X-Received: by 2002:a05:620a:29ca:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cd5afb6a0cmr454827585a.7.1772705196037;
        Thu, 05 Mar 2026 02:06:36 -0800 (PST)
X-Received: by 2002:a05:620a:29ca:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cd5afb6a0cmr454825285a.7.1772705195580;
        Thu, 05 Mar 2026 02:06:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac66feesm878548566b.21.2026.03.05.02.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:06:35 -0800 (PST)
Message-ID: <8d7a25e8-3af6-4adf-bcec-394895519bea@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:06:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: usb-hs-28nm: use flex array
To: Rosen Penev <rosenp@gmail.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260304230636.27808-1-rosenp@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304230636.27808-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ILyOfeoJG6UClkkn0nluSCDWzkL6G_0l
X-Authority-Analysis: v=2.4 cv=eqTSD4pX c=1 sm=1 tr=0 ts=69a955ad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=fNKL0_Y_EPOiR77nuckA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ILyOfeoJG6UClkkn0nluSCDWzkL6G_0l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MSBTYWx0ZWRfX8lyuO1K7TRNh
 UglDYOVlU9TrXN6Im+i3VuwaOXJAeAnt2pEIma3LHNZE5ky/PwTD869XbgtYs7GL0eOggdw/R2b
 SZ2AuCz0rx7a9XfJmLFqwUSbmcE1cFLSEAPB7oHrR+p7taM6CXsrL9UIGqSvTKa0Z2UlIxEmekt
 +NYyw9E4JQpG9V3Dm0T+OtVedTU3dsehvScQoHTyXvhmPqx1xncoK9MpFmLTD2dIItEPBgKuU8T
 e2qoIzMRKFVTJ8HhIwdgBlJgqoKUKP8tHzAIdV8WrekQRRyK/+8q89GI46zWgqGsjCGwKp6S6J/
 TX9oziiQUGTQI2QIPOWSIjWBEsbd7Dcq8N2qoKSRuRws3skL2OdsTT9MJYVKDGKKRZFRqVwN3wG
 RuNhlSd08i3guTiR3OqWHbkWxQtnsSHRxinyRHoBTylXh+7WADz0jE4EVU5JRDPU9GSiDNypUit
 IDQJxh7xSzMp5snsKJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050081
X-Rspamd-Queue-Id: E575020F6EF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-95583-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/26 12:06 AM, Rosen Penev wrote:
> Allows simplifying allocation to a single kzalloc call.
> 
> Also allows using __counted_by for extra runtime analysis.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

I don't see how this is an improvement - __counted_by() is useful for
cases where we don't know how many entries there are, but in this
case it's fully deterministic (as priv->num_clks is a compile-time
constant)

Konrad

