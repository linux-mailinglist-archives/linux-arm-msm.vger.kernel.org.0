Return-Path: <linux-arm-msm+bounces-76799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 594E4BCE150
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 19:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 503E3189ED52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 17:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5522022069A;
	Fri, 10 Oct 2025 17:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKOEdXUq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03AD21D590
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 17:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760117316; cv=none; b=oRNwfbEhu8TSQqabVYhhpIY15CvEkXnfv3g22wwTf52/MPHCCuoddlHGSRflwpiDazafe2yebs9wmUJPF8EPnJdR/Jcj4eUVqiKloxKwQMlCB9RTtIF/nruvQsfic39dBHDsp1McBsUgsj33VOjvQCohvGDtDfq1G9+IUhvmALk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760117316; c=relaxed/simple;
	bh=/adNrdiBXGreU5Zv1TBVSGHzTcP/X2qnzXFeQoZyAeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lotRwblV4Q1JBYuO+U41qPFT0Vw49ZceD5Tp2qJWZwGtMb1Is26AYkjhATRbRAONdE5NuX5mIRl4y50IX2O/hxMSqDW2WobHRSxkxhX0YAl4EXUW1xjI27E942bYbk3RkMfqGYk2l8DwruRAzuIP+u6WrIv/Tl6pX87+AGsvr+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKOEdXUq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFkPSr019486
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 17:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5RtO9UgOqlSPMcNOTbaUjDba3fAyZ6bvIxzoBS2IW8c=; b=KKOEdXUq6dzVIpSr
	LuJS0xo+4fVpQm9ipytJjhUyIbbZcPvktUogcCD0y3+eJLP8s1aJR8wvmfndCjno
	kUTsWwQnWkASOVtEWbTyeetS2luFQF+r5qQy8uWhjboF7y+oXDRfMwxmjdIUm6zh
	Xucp23vVwHYDaO1dFREHLpY6jQIm0J6Q4lZ2nSt5HX+nHmgSoHO+NZmHxjDcTv4v
	GzKYKwalDfMEJr6CHNYseyZo8a8BXahcS/PwdYG8/Hwq7NyFQzSBlTPkvmHO0NM5
	lqwKsGSiqsGerVXwef/LdLWeyXVc+dOGWsHlNn3SCjrA3fT1wn6pgBa8boEAw6X1
	mSBAoQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m784f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 17:28:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-85e23ce41bdso98880885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 10:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760117312; x=1760722112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5RtO9UgOqlSPMcNOTbaUjDba3fAyZ6bvIxzoBS2IW8c=;
        b=Ax18MVd6yuV6okrnXc3ctNUtb4vWOhZb99JcC40lcuCJE0TYUMiLGz8rV1AoWHRq6q
         XIkmmyDjn6J5XSyGz1ZoEwb4pjmeGscD9dbWnnEsEf1zN1jRi2bK38kwkuimgkuVWdQO
         CvKGiWzqJzUarRCjqwI+Oj+Kh5h9VtOTdfZ0iOh281VPHRl88ss2Z0AJVaPlBERrWvGC
         /plHv86U9qXzZS4bl/Po1Dl+cxHHizzIykzl4BTDV5w7BgQhnyJezKP6Dfj1QLBBKNzP
         lMWFmFMBnSF+Nq4mJCN4sufyDN1zJTiBw67fiOl7/6awKRIOJsWUGuV3Ib5GdSNminmm
         rK1w==
X-Forwarded-Encrypted: i=1; AJvYcCXul19b+PnxeOVY1VRt+lEo4kRcVcLpsmgsPpCMYmV6VW5HotQLz62iEFTWTNqCtJ2N0toxaUaYSt3lVeDx@vger.kernel.org
X-Gm-Message-State: AOJu0YxzqbU4dJY5cojO96nRJnx8moFTDgcCXMO1SOOmlu6gINzgNr/M
	qWf3noMjzHv2CKQU6c/gIjwWId0bpN8ps66Cd3U2xucoe8QoWidQDLG1dQCFLPcfG1o3DG4tWDz
	8iMuYY0z6qPP/prG9XGxweVNiw94vePNhlx6eSw/IniMY6+XyTPhKs+qLDU8YHQAiC8rl
X-Gm-Gg: ASbGncuR38rkYrcHd4qRW0d2kErsR394DO7k+aSbAtwO+0iyYO0aMB4VIAjUTGCOTmz
	9uf2yJuOOBETh8vtQj0asasWydNxVn9LZdBGiPUlGvPiWqrtnEzf6/6vkRxnbg/I2Zye33gRcSu
	Cc1Zm0IL/Fp88xvmy99BVsVHCAprOH/7RbPNj71zeNt3nImgTFLvrAB97u6gB07l8+mielCCwya
	Cq/oC40SksjD66OYrJeMfObRgO7fYq4MCiqRxFBI4ygKWQxqdFzgTg9viM61/edc9LxnlZ0ia4M
	geE6ILk+V3pIl8bvJCrtNxq3zHrKhJALl7W6yhbImwVgvZxnjt1ftxt5qFtNEU4EpU0jy2QLarV
	VXdLfrk8ez7IENIvr2IIDfA==
X-Received: by 2002:a05:620a:28c2:b0:856:6bcd:4adc with SMTP id af79cd13be357-883544f4e27mr1154163185a.9.1760117312468;
        Fri, 10 Oct 2025 10:28:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDtsBobK85gPBifHNNJEiQy1NEmBXZH06eJMg5hBaBeDWosJuw8Hx8ajikWbGG7O41+fj2DQ==
X-Received: by 2002:a05:620a:28c2:b0:856:6bcd:4adc with SMTP id af79cd13be357-883544f4e27mr1154159685a.9.1760117311864;
        Fri, 10 Oct 2025 10:28:31 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d951deb6sm281479666b.76.2025.10.10.10.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 10:28:31 -0700 (PDT)
Message-ID: <61f77b51-af6e-4625-8d58-fee8f93e1d5e@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 19:28:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: Add support for Huawei MateBook
 E 2019
To: Jingzhou Zhu <newwheatzjz@zohomail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251008130052.11427-1-newwheatzjz@zohomail.com>
 <6199698.lOV4Wx5bFT@debian-vmware>
 <c6880fe5-029a-4f8d-a08e-81a066a79450@oss.qualcomm.com>
 <2386127.ElGaqSPkdT@debian-vmware>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2386127.ElGaqSPkdT@debian-vmware>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXwMsQbtn2pEly
 EEbJk8ERfgEJe9b4Y0vzxsctdtIXGIZjWLcIFEM91vL6rx4Eo3uRMkmNcTcAr5xccE3UQJJqJcL
 ZMB22163Kp/h9rctNO54ld3Xz012iP8os3L5vmnBRWJt0XB2bSSXWQAoNbJnw+bLo3wXj7t5+K+
 rYrDow2P8j2zLQuGM8yufBulu055F2YGoKQT4LfW2r5yvg7LQEhYPYUSdFHQ79btFUa3h+QuGsM
 HUSVd4rOKGuBa5VzLzhjVDCo/3ZTkrDRU2fJextIcChajx5lcVyjrkOsRmLHfdV2LyeKz98IjGU
 0fkuwNMqvMXwPpJgQ7RENAN7N1YZ40b+7O5W5ZYKiXdJRqFznXCaabjv9wscJgaDrMdp+4v51bh
 9CSPr9I/wNtHiN93qc1Gtfnvca67zw==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e94241 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=wbXqjQ4oNPLq0UupdngA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: dlSp27fpdbrMWwH1k6nziCYlMCRy5Jeu
X-Proofpoint-ORIG-GUID: dlSp27fpdbrMWwH1k6nziCYlMCRy5Jeu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/10/25 4:52 PM, Jingzhou Zhu wrote:
> On Thursday, 9 October 2025 21:58:29 CST, Konrad Dybcio wrote:
>> Please refrain from resending if it's just to apply tags, maintainer
>> tools do it for you
>>
>> Konrad
> 
> Understood. This is my first time to send patches, so I'm not very familiar
> with the tools. Should I wait for the maintainer to pick it up, or is there
> anything else I should do?

Because the current version is v6.17 (not -rc), we're in what's
deceptively called a "merge window". This is when Linus Torvalds merges
pull requests from maintainers downstream of him.

Your patches go through the trees of these maintainers, in this case:
qcom-arm64-dts via Bjorn Andersson
	-> soc-arm64-dts via Arnd Bergmann
		-> torvalds/master via Linus Torvalds

Maintainers generally refrain from accepting non-urgent changes until
Torvalds tags the next -rc1 release (v6.18-rc1 in this case), after
which they start picking up changes again.

After your patches are picked up, they show up in linux-next, which
is notably a release ahead of torvalds/master (i.e. it previews the
'next' release), so if your patch gets merged when 6.18-rc1 is the
newest, it will show up in v6.19.

Another note is that -rcs are tagged weekly, and maintainers are
reluctant to accept big changes at about -rc5, since they need
time for CIs, build bots and users to test.

A cycle normally includes 7-8 release candidate revisions.

Konrad

