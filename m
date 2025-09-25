Return-Path: <linux-arm-msm+bounces-75095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9157AB9F44A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E21867A5555
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865D626136D;
	Thu, 25 Sep 2025 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmGVRa9Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98357259C9F
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758803456; cv=none; b=U+kiDpq4ChDHn/mFcLNNS/dEQZY9NkO38iBN9nEtyd3UR0YCMaUxdO/rXxKZaET5f8yXND3j4i9QiWDaH5EOygmUzpEh9ys/I5k5NXqDt5fizOKycC3Dyn+kXUIrybF676ZfHES/OhNDmSast4uBy45eQPnAotFVwwZ/oil1rK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758803456; c=relaxed/simple;
	bh=7ew/W+Ffe0KBAYyes2vO95JQpX9yAe8JQiojzZrabPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TZlSyWI2kQsa+19oFnU36KdwIGXJFaI4oIxfMZUWy2OREiAO9tm6Zs7U98k0qO1e46XaFMIOaKDE3Y1/Vz2kLbQB3WUxlrslKV0VK28FNmSLKt/jEU4m/iRMWgL6dKJ18m8JuRr05aFD9wl+dUxdQNCuZin3wH3I+ig6O8GxdLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VmGVRa9Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9D3Ot027304
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a2+3a6uGlyRN5xorj47QcSLNbjRjLn7ScwNgiGItbrU=; b=VmGVRa9ZMQGHh/qi
	OPIKsOoEpllEfHV0ggtrq/e5HN2FVto6jE+R3L0OnzVIq7u3WK+s/sJq7VDoaN8+
	TCW0BlzWoJFWpoTksr7OsDq6iOzbBsEY4Oa4JRSHn0O6LcYql58XrTYfVKPjEdOz
	5ZSzyXrlw7FQsBRTCPs0muhFo49uyhMQt4QPcdm0BjPR98nNPJMEDHhndOuHrSJc
	MgFjMhNsxfATVvGK+nKFjCK51g3HoBFvGNOX7c53Tq+pq7XINE7CYUFOLzM3dhtu
	YJWi3aq52Vre4vuTCVnG5qh4rJw55YIXr37+EcFYNaoa2wNiYMqkiRljbM2aVFfu
	JjEndQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv182xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:30:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7cc365ab519so2246576d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 05:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758803453; x=1759408253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a2+3a6uGlyRN5xorj47QcSLNbjRjLn7ScwNgiGItbrU=;
        b=KRLnNmLD2oubpCORDDlwJUB9oL47yNbiO8DZXauWWl5c0nsqpoEXJ7DuKqwB2SmR3o
         ZhxEXAnyqVKo8EpTp1oo0rihTgDY1EjgHNtofm2g2PSIBAhcAHuvndNcAAjmJrvmjecO
         vDnj+h0tgQcu0ReB8Eu+ydpp3owHJ+LFQqJ84xM/tomPG04WY98Ph08DOlw22wfcXeg6
         gXYrjVSo7xnG4GClvQJoiD2tbzVkQxFqzh8K3hibZAn5ksvr1RNVgtSWyV0xCjgs7H5M
         YbaOBrWPQ33rUFc7iCmlKpVJ3XIFFpEgXf90uiD970Nmg/J+J7RS+NuyJ+vuPUta11Cj
         d4dw==
X-Gm-Message-State: AOJu0YwMG/0cwzDk/nwTQvdJmAN2/jkHLIHBo44nz6D+Obu7kuceD4QR
	vbL4tvWs4AnrB64OBgREQJZ50IVQlMR8r+nd4K3+X0KheP1NBT0LF9Vy+5vNmvFnuEgE1CSXsaj
	ahq6ao96VVNQR6aolGa18ARlcbSDyTgAljyFWQKNzimyv6+FoJ+T74XqbsHaXr52t7OMt
X-Gm-Gg: ASbGncvY+SzxN32vlpdGIpD4RifPp3EqW2UBI0Q9COqUGGAGRWps7Qa+kdwH5UDXMS8
	oTOJVN0wrz9nbFgQGDwLlwcBc/PGqxgZAyzeDc+mzD/+x3DR0V1lrJnzb8jG3u9FkSuP0ryE7IP
	BKy2pvQmcrWlA7HroeVYC24KOvqhNPGnP5gPj1aj/uMJIHKC/T/GvesVGnZa4bJgWpPBLMnc0C3
	LYp6y27CkQGim937TbnY5QG4xcqFGIKw2LZ/f56+CC3hUVEfRSV2+oJC1Srl1DcdXYhJl0EzMO3
	nti9E88UosI5ojAMx3oPlA/qF2Cj5lZNg8Wx7OA80+uxMa8nnMTMW8Pwf4pIn2EhO7vrpgoiPUr
	jwWCd4xrmvGpFJ2ciT0DjTw==
X-Received: by 2002:ac8:5d08:0:b0:4d7:9039:2e87 with SMTP id d75a77b69052e-4da47c063ffmr29352331cf.1.1758803452591;
        Thu, 25 Sep 2025 05:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6EOmvQw8+zyiD5JPVWFExQhq7VAwgLKd4zuEmNy7aNwJAHke/OZ1IRA4eTgQWRp3Z0UmA9w==
X-Received: by 2002:ac8:5d08:0:b0:4d7:9039:2e87 with SMTP id d75a77b69052e-4da47c063ffmr29351821cf.1.1758803451871;
        Thu, 25 Sep 2025 05:30:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3af5721sm1121368a12.43.2025.09.25.05.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:30:51 -0700 (PDT)
Message-ID: <b25e5df1-8481-41fd-851c-5463389c0689@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:30:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/20] arm64: dts: qcom: kaanapali-mtp: Add audio support
 (WSA8845, WCD9395, DMIC)
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-18-3fdbc4b9e1b1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-dts-v1-18-3fdbc4b9e1b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9u_U6CtaW66pBv5wuMk43wZZJcFQyZZG
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d535fd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3dHrxlFa4xLiy63zdp0A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX7TIy24o/J5g7
 56n9qJcqUi8vfIp7KaPofalncL1B1TG54rmP8YCtPqXE6hDPSRWXXWC+K9yr8SPISAfIf5KZZDL
 Popf0Grbj4T33H/IpTFSjMkfFlm3gTk8boDqPN6fg6EtS4O/lLdQD8pXAwIbr85CEhOoLQ4iKrV
 ljregYHQpmXXE+Unhd3wodRk00Hq8sEQnmBDdyrBv7M7/0Lci7wRe+HIEGyG+B8i09J20YJstVK
 wW4FxhhKosxKYmydHA3QWkbXjYhZU3sbukLFpkFN8jmgiUkzsgXlfPILwOb2CgGFIbxpismsAkx
 UmoouVY7IN0J7ERPGmUqX0pt1f+TcNXCtI6p+gizwBnACNqsTTdlqhMdSxr8CngZmLn5pZnmPGY
 b+i+2azF
X-Proofpoint-ORIG-GUID: 9u_U6CtaW66pBv5wuMk43wZZJcFQyZZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

On 9/25/25 2:17 AM, Jingyi Wang wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Add support for audio on the Kaanapali MTP platform by introducing device
> tree nodes for WSA8845 smart speaker amplifier for playback, DMIC
> microphone for capture, and sound card routing. The WCD9395 codec is add
> to supply MIC-BIAS, for enabling onboard microphone capture.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

