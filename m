Return-Path: <linux-arm-msm+bounces-56716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B90AA87DF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 18:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96BCE18982C2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2FA1F4C97;
	Sun,  4 May 2025 16:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6XVvHgG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1631E5B7D
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 16:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375239; cv=none; b=Q5/C5/eYt+qgB0WgTUDycG5zlDLhp2pIlkRnC2cFY7osrt0I91onQVCI9FsO9FjhBo69CaFn2i+dMvnTTjOVxl7aEkGmQzbe3AMXoADEzEhMerO9lO5NjALlu8reoU9iGmKJnuY7wp3nGuOb/i9tTeWtqwwl+PiHde+HiOW3lbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375239; c=relaxed/simple;
	bh=LiiIOXZeFcrFR5Wr0strWiFYZsNp/GL21CWg7UxWNPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pL9yEdAE6/Zrvm8rw2s5GKi553t02iHa65WE9vWr3EPJNHQ9QDAXP6x1cAdxf94NKGl8o318yyyYZ1tsh27YSf77JBcx898M57Srvm6S2jq7Y647/ye4hNBjNT8TJrtMVeE9Tt7wr3ntIIKXEleuCZIRoTuucz4uCOIBkuR2qFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6XVvHgG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544AtBhS026995
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 16:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YpRdgnHDvP7D1x0JNflI0yCjzYKAnzgn37H44xlpJs4=; b=N6XVvHgGqVq3Z7nF
	Dp/qgyhEEixJjIPcyfF/FVcF3tF8iAb0lPBL4wN7eUcHf/9BPKZmPls3EXW7Ow8+
	DmXSjGiJXrvY8HkXyCLb4uXat8Jqaf88jwMilaK7aKcT/qH583+aO4h5U9h/R2Ra
	Drb0QYDMSb4YjcrUn93uJLVkpE8RoiEc3ow7FMXxFPkPeBckF2VmDi+V85hvuyiO
	fhqs4fRsyrVjmnCPB2GlLA8HnKzqAhFN3ZjfnhDeeI0G2Gl/WrgJ+EbgJ9uxoJh1
	r5Ys0wic3+ERFACI7yTsdSPwaUfOztpsF9r8KQRf7iehupnxHC5CaFLSp9o59ELu
	zARDPQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55t7d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 16:13:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c95556f824so343518685a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 09:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375234; x=1746980034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpRdgnHDvP7D1x0JNflI0yCjzYKAnzgn37H44xlpJs4=;
        b=uBl1yVkpIIQ+3RyFXNAlUxEORhDcDNtjWk7bf5AcHYaf8h0siXv5AOMxCx9NYyluCH
         aqKtJceBFbhLAyFEcW6JizONnlo9uf163Yuo8rSVDG2V2U0G6sGtG2GR4q3RnjMN8FnM
         K/ShTPns4u+L31wk2QkQ9gKox8yBrqm8uU1SleJpzIaGqbFD1ZLr3eTMhWmMSBT/yZiL
         eK9T92nCMa3i6ZB769MjHGmDPzW9iswuSKg/Psy2j68wwf8dLRTlCgt/0M+LKIGUnCmM
         ZsK+pEE7vvkwZfG+wBje95JeRC0kLSc+a6Slg1RcaQBfEVxNreerPFSnVST1sGQWIa9w
         +8wA==
X-Gm-Message-State: AOJu0YxK75onVwQw1dOlGsOo80tHyjoPNAIcVXxfRAZzxiaPe3uie+h9
	QG1tqlwsYLK1khiujFTiPX1/v2quYXNy98Qa/Yh9Le4iEukjKCEEduK8dW0D/z0WlFMLTiDQHv5
	3m3fY3Ih6VtlEJUO2GFY1hlQN8M+YdPum50eEaQdLd60+T8bjPzixj4m4klBw2qnP
X-Gm-Gg: ASbGncvAAXqYQk40W/IKYmEMmIwX4aVea8lA4tTH461nXdmDLXWB6R9D5f7pz+QN8Zh
	csP91RwKV9GW0JZ7yXSru1ln5DTIU9yDW1snodyzYKy12JEHE93n2oUkQAhBQUJT39J+puFwd0+
	Yv/wAnI71peXha4qym4bmxDlmx4ZR/kTg/TnxYoADHwWODehf+1ZnoRJndvHpHtWJpWOZ5/lCOM
	jhZezQd2IvuloXcJbA15jSVbPrpVsE/fuH3fA1fkM1DrHkOulyuonLaeLCtzUOrUKbzzt59NOeS
	3oSdUv9q3TvahSVjRSNaURR/DkEMsDQl4btjs9IJcZOaShSXbRAZ2VWHeJZilwQ0kFQ0PuLN1ou
	lL8JEDYMeNjuKCuu+vfJxTGDK
X-Received: by 2002:ac8:7f0d:0:b0:476:a895:7e82 with SMTP id d75a77b69052e-48e01552584mr75445921cf.50.1746375234607;
        Sun, 04 May 2025 09:13:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhEOxFwHYPaRivE5KuBUUSrIQdtLUQdGkwtMO2jrXIxKo/JL2oOjaGV22aEcp+VehZmah9tA==
X-Received: by 2002:ac8:7f0d:0:b0:476:a895:7e82 with SMTP id d75a77b69052e-48e01552584mr75445631cf.50.1746375234338;
        Sun, 04 May 2025 09:13:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
        quic_abhinavk@quicinc.com, lumag@kernel.org,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        Chen Ni <nichen@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Convert comma to semicolon
Date: Sun,  4 May 2025 19:13:30 +0300
Message-Id: <174637445763.1385605.2171270817711925653.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410025221.3358387-1-nichen@iscas.ac.cn>
References: <20250410025221.3358387-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX1Ghs/+sqRsZr
 rwOdiLIv6zh3fn1hNoqECuebWfklnbyf2IoSNijOCg4LXxe+w7xRh5l15/Vc4rN7+zeR56EbWgt
 Xes7CTn9DJqjXj82LJXQTcYz9CizqOeKsn7TxWZGOBqeMWfQXOLiUek8zBN+OZ0FkafjRwZutXD
 P4avSBA5TeGmtKaOBO4Sy1A5VWuPsApUkOzFgKOQJKTDWE4urTW8STBbf7sCakvxvcd3SNyZ385
 BbARkpv1fbDQdD5idP/sGwLdB0TXjNgSD+1EBZDQss+Ju9PjvEn3L15Rspnht7l+NkMalLrev3p
 AbivjdHIF2caAhq4uJs8An0xPVtetUbSgRxHPLkkkBM42GCTjoEZvX/BTup46/I+Pbr6Nvs6JMF
 bomu01A5segefn4mz203SQk/II9nSHee/nDGSYVOS2pH6E3Elsgr+apX1V2m8lpDmhAXrz5J
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=68179243 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=sNhlO-HqowW9r6Pg40gA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: X2FbL5Fys2Q8sa_JECALiXVp1B8FhKrc
X-Proofpoint-ORIG-GUID: X2FbL5Fys2Q8sa_JECALiXVp1B8FhKrc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=796 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152


On Thu, 10 Apr 2025 10:52:21 +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Convert comma to semicolon
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5db5401c2455

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

