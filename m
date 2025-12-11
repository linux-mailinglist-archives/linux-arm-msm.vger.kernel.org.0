Return-Path: <linux-arm-msm+bounces-85030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 503CCCB580B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 11:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69E823021051
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 10:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE395DF49;
	Thu, 11 Dec 2025 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDrWvMMW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDIFZ6sq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C8223817E
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765448445; cv=none; b=Ew1JNxx+jtPXlBdTHn1AAuPidkW8ZEA8ody/6yTKOgwbL3Y56+oxqH7e8jMsLXt9hDNKUBUbtShALcVSYd7LI+hEYz8oVZq8An9Aj/7ZAbYkm5rGRBtyblUVyOK5JZsvnhC6FQa2zGQNlgO/rb5Mu99A6l0gfngsRUZ0/vtZ3kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765448445; c=relaxed/simple;
	bh=Y3cdtkIMwGyW5ONOCORA749N9ti5mDASb0PHkXUJmcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFKAImFSPi/yOIBJoSznBewKi5rpT74qJHq/kmxjPjUvE51mLEvdfUlMHWQkb23QjlWl1um3Q2Fla7zWBgngITuqg3EAI83IzIHxO3VCl5flqdVcFU2vxoVogzQ1FbvooYaxHBnrueVo+nDH57hAdbkrf1xuEkAH9qV1MNaRlKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDrWvMMW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDIFZ6sq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB9ZPC6898915
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 10:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rq4x6isU1W++cT3HFY1FJbiW
	jgg+1qXYsgBnahwAviw=; b=pDrWvMMWz2EH3etN9/BqOVa+/agAk1QrEAQu5kcU
	dDIZNmqflSAOL7w7SmZxPyHv9+2NRnMdc3sFjPr4LUddrqwEUA13z1a4N8OnLYlC
	vE6+Adkao6RX9pIlJDGMVEsrgbg1N/anx0C2YPK3wxF+BHAC6kQ9gc4AaxA/icZL
	+zoM4KuCIE45OaAB0+CpjVjzhvIb9MW12mrNh4qHoiFHuB9JWOKnKrdTvJbeLWAK
	VAjT7VpM7XD7Sl2ZRC9hbf8p5/pMtBVnQ97cK+PsWaqJgEGAsV+mrePJa4bShbnM
	bXnzAz2obFpz5O1L1AjykQNqaM+wAabSFhP6o7w6sP3xtA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayrpagqes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 10:20:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edad69b4e8so14714091cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 02:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765448442; x=1766053242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rq4x6isU1W++cT3HFY1FJbiWjgg+1qXYsgBnahwAviw=;
        b=TDIFZ6sqwJlS15aIxkgqHA+yC2iJ2wuyR+Tz4a8Yjx3rAb69eMW2fkEAnrF1cy2c3L
         htdAIS9sx50mkgVE/2aJfRhlJEOf7izSfgiDecibzqvSeojEfYAtrbVJwlV9ATgOQJPe
         Sq3yJLNbpHXlszIZLxPsiCC7zLByof8VHEccWsg6ekvOsGJIirsxVcyRK9RfRLc4n6ih
         E2Csbeq8GgG9DmYB4R55Dl68DVPbhgp+yLEtB/yXEHdBLRbi+9FBDdJy4E2dTw1cufWc
         +Bau6QHNtNPVthpl9F8bLilUSCaJENU/PoHrzC9BkqQWKT5pqrN4VRtESl9FP/NGsKUT
         cuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765448442; x=1766053242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rq4x6isU1W++cT3HFY1FJbiWjgg+1qXYsgBnahwAviw=;
        b=YTcFSh5zjPl195WU6HESkMZOLDjINRoN7Y/gkl+ExI9a5nZv9/NfGDcI8dnAnY09/E
         z0UR5eXpCtMmuZMEQesULE/CSDbZsZG4G/bAKTlZo+aIaXyk4XRe9uL+pZAg0P74gFWg
         1lUefNfZx6RI82a1A+3l2cCo4FIIz5i7QHAhc+UwVrFfTEVbCBzOMZN68ZTgG2tjdUfa
         33afjq3+YDL+HrVrpt5Fa5V1jZunqMS1DzIYSSkZRpX8ijtp9toXY8qDVmWBheTNeW2n
         7b7PdTbnRZ0nU9bieSbfL4NqWj6r5U4i51ZuLvVe3627irCNi2mD38WPxQWFgt+YUOZn
         QFCw==
X-Forwarded-Encrypted: i=1; AJvYcCVn4H0v+LWeM1WLcAnxGh5wICkELXwlFaxquFGc4EioUdvvvOpdGfhXvNJAJZ/6aEeNYsLPLYNQynl2YWGk@vger.kernel.org
X-Gm-Message-State: AOJu0YxTpFjpFL6AsOtcCibWd8xz0smhaANVzN75HChdFmwyjDcFWHuM
	vcK1b8on72t6cV9tnNFD5ybofrHIL/nr5RMZg8ZtU/Ew8C/tmMWMwqccL7tWQvKirdm9RxR1X4C
	vIpDAa+qm58JRs0IEjC+ytmfRxYNS0phBE2qOECc7REcgyQF9oo1DfC+aWm1T8TLPF5Fr
X-Gm-Gg: AY/fxX5uTMxDwjbYSoocygQTsaOOa7UKljUF+CD5Dcts68Y4PecvtL10+A+Q+AKCPaR
	R3s041OIUQmFN6ymZJVrtFKlNvce/kBcii0d7nXRwGPit5FPx9wqWMPUJmHdGZYQmM/b0j9kcgo
	ZyYUZDw7oTY+W3NvXvyBJ3jBZSWgdMjbQzLCR4EePRF093I4EhVPuZr+KIrbjSa0S8B8fxtCUfB
	5KyJQlapPDxTR/oB/RJT2rNBBg89nudvKuXEgzL/haheidMVgiUo5JzoqtYnw4OSQgielTCaz3E
	tjTZUs9snwbsKa5O2aXuNxX99b2cTSrUV9oHX9sbBWHLEHsvqu3bdQKttYZ4060gsRUrkrFAYyk
	2901dzfImzTwHPbfVlS62fw==
X-Received: by 2002:a05:622a:1311:b0:4f1:8bfd:bdc1 with SMTP id d75a77b69052e-4f1bfe7cb6emr18272691cf.40.1765448442472;
        Thu, 11 Dec 2025 02:20:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGWwUeSB/xMxx/IAJiwJKv0ecU1P17oOc6uFVfHwRIS48Z3Nk539gq+qcklTdZBf2ejWslCQ==
X-Received: by 2002:a05:622a:1311:b0:4f1:8bfd:bdc1 with SMTP id d75a77b69052e-4f1bfe7cb6emr18272361cf.40.1765448441996;
        Thu, 11 Dec 2025 02:20:41 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5c8e59sm226329266b.62.2025.12.11.02.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 02:20:41 -0800 (PST)
Date: Thu, 11 Dec 2025 12:20:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: SM8750: Enable CPUFreq support
Message-ID: <gtjkhssrzckfegxfkjt42hz2zffkrd77wukhqwmzxnk5fgpicv@mebbk3x6dgbw>
References: <20251211-sm8750-cpufreq-v1-0-394609e8d624@oss.qualcomm.com>
 <20251211-sm8750-cpufreq-v1-2-394609e8d624@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-sm8750-cpufreq-v1-2-394609e8d624@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kUgAZSCarBBu4iBKNRkIV9O_MsJut5rJ
X-Proofpoint-GUID: kUgAZSCarBBu4iBKNRkIV9O_MsJut5rJ
X-Authority-Analysis: v=2.4 cv=G9sR0tk5 c=1 sm=1 tr=0 ts=693a9afb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PptT_Mh96ff8s3TZVEoA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA3OSBTYWx0ZWRfX56PNmZnTVCOJ
 sn4SthV7NVhFUWGJtXcsZFarLFhL5ezbqhU1CGLb1OvOsf/bDmrKIB+rTW7YT5vX/wSzq7UyX2d
 zSTEuoevbvuPmc3GWydMo9jlcUJ2RGmXB0zXCUifxRHd+4yVFOFVdch5dXqW6tVZsWtG5d/v/Tt
 CN1tqtJE8ua+tTgCeu96V0pL3WpK0IuunI85+ZqEfX98Yy2RuRY3hMiftQkI8z73fch5V/5y0t2
 BTZguHE+bS7ijOLQuisIamLUAbxlD8CciCwHocy6rDkSsIuoAAcp5fg9YqGtdtUsSDKjsf2Xzqd
 40MAmmEk+5BG8GxDxojLqNwQAkYNeWf0+NyGnZXQoWlPPg2RjjVM15Y3TKrdED1QeP2VT4Ph9VZ
 iKfnBLV8/7HUtHp5v/J3mX8zPpZBdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110079

On 25-12-11 00:32:24, Jagadeesh Kona wrote:
> Add the cpucp mailbox, sram and SCMI nodes required to enable
> the CPUFreq support using the SCMI perf protocol on SM8750 SoCs.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

