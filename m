Return-Path: <linux-arm-msm+bounces-89283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CEBD28A54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 22:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C10C30F8F83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E11231DDBF;
	Thu, 15 Jan 2026 21:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFICF+ga";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gCtI+hJ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E377F32A3C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511180; cv=none; b=p0evm3JidjA+O6UEAsRnpMka7oKDREgAURi7BLxD8ugRJvaHkvEBCbNeAKyMKZT8rMD2l9tUwRfyVq1lD2fMcAH1c6/V6H9tF7J0sm1E9QxYVh8SQv37le9FrSordNECfWXzr5nwq3k44MVzG+zrP4jnJKk3+vcyaZ3U3gImoIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511180; c=relaxed/simple;
	bh=rvNho21ovDEnl1XrGzEX9DQTCL04lvRzb52sRSJPCqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fqzDhFDBAlgNrpboP9J9gverkSBEdaXKbk3JtxJY57JI7C8CnpGHwWh0D2+H4GU0E+w0FXT/SMQKLAt4pRlBJp5JZQtczAKomw2Jds61olAwlGdI1z1vZX/KhXyU6ZLC1z54eyl4tLCxwlkGQ6NnPzsaGEtqI+rbXZ9uNBXoi6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lFICF+ga; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gCtI+hJ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYGIl2866209
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3/lSi5tJmSDkk77YoSdZcYfEb4skDRObrBrQxoLY+q0=; b=lFICF+gaABVgQTny
	N/CiKxWb1HRqPSpBiUY9iRo2lmE6IzZibGEYqfLQNY+mAFZseKhMfediFFwC6x/U
	4ZS5tjZe1iIm0fIkb4VkSczBGG0hNvtOvEKBEgzRsQu1dQVKH7MHhRxMIFBH7Omj
	xBDqgDDnfiChreRxc8NZjeC1HeZA9KtpRaBnZZOVfiZe+xDUCo2kTd+z2WYKnAfG
	fUF6ntjUWGnCHOyuyqO0RANhClTnoNr75JIxSLphHj1a26mm40v1mD+SDkteSMxQ
	7nvyFlwPbe64LQPX5qjG79mtprbsYzIx5QNDM3EpBn9qm5c2cNZ6T9vqOImUKSoP
	Cybj1A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2jfhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:06:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b9fa6f808cso440083585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 13:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768511162; x=1769115962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/lSi5tJmSDkk77YoSdZcYfEb4skDRObrBrQxoLY+q0=;
        b=gCtI+hJ93tVnGed3GHFASzuDPf6efBjqb1xQ+TFLNFDOeNMlb550VmogXnAidMNcfI
         6rYZwqeTqljHcsPPauXKPlwNjQb9EaJtEIvmLiBkEyMLfHAxLup48CtE7jQ5dCVYCyWP
         vkDqJVAhlG3SMX6Zg3ozRwG46ZUsWgOkxAfC5jrqsnj2tspTnTBQE3bsSAWOwj9lUtUi
         AdoTqEIV1AgTLpSBIbz1QsfUvQAb0sf19ICLB4fSiHo+5qI2F+dSmR96vvBjV2dzcS46
         S6Yk9wbR37cG7sqwiVUNP/R9WAbzF+BdgfN4TompEy1IBZqe6W8wlfQ3kjksNKHU2AcV
         8rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511162; x=1769115962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3/lSi5tJmSDkk77YoSdZcYfEb4skDRObrBrQxoLY+q0=;
        b=Idh1SHQch+uqt5Dm/43t7SefUIETrN9XcGo2qnThN9uuYeN+Pvi22/o91aw+jK9lbx
         bCoOfI7iNfMvqE1/1QR7ROJzn66+EK0bDW8Pd5ohBis0l2BfGU8gq0j168iBptUq6SbP
         fDeAe6fww/Ms/gSvCifDueNxvQO4zxLRyZSrJg7Zu6YD7J7yz0L98I+qdRUTE8BE2OnH
         jZ7BjeUjSu0TvfV06BQdhaALCONqNY2AiyOciNSYakq7Q3QvcVXrBJsNyytjF1yP7ZqS
         AdnXVLoDZ0NJu+AN8AB7FJtjiyrDSMBJ4I05hOZyicp9uSCJVNqMGlqCGIe6Nb+hRu6C
         Xf9g==
X-Gm-Message-State: AOJu0YwbFY0NUC9Ybic1yoLd5wf/XA/1WS0S4OHd66WUvpEhEgQpLI8e
	QldkQJU8twMh+H/dXMfICq7msGjbu2UuV4R1z7q2i6Jl+PdnUe7Dz9EvDD61Dm2cTyu1RbxazyE
	VOjpjf+FiyaU7duAiPEk6yzbdeLaElPg0MrjTybOEywwNIi27Q90z70UANpk4kT9hHR4I
X-Gm-Gg: AY/fxX66bOLix0vm6Z/6muW9rJgh81TM3zf4lZpiCmBDOWHItoU1+GfyfMvjc974BjI
	Fr0oYJYO+2OI27ut8YS6xVt+Rz2bzj7Ntwx8IJAuv7hayRTujYARESHB0BK+FcuUKZhhjdFBDcO
	s1DD0/SdtW2ZEQri/DewGkQZLZDJXw9qWuWoB0z0Sc91jZDgunlKZzA1Oad2HajRMtmxRQs3EvD
	0UifHlxkcAWDzj+/gCgTt0JosNRXRb2yKBkttTMVy+HQ+Yx+z7SMwHY51LroyVO2Rlk0pe6VywD
	C9MndnSSeLvVAlsE9cMaHlHyDCzPiyBjcxMQSo03cwtyRR4D8Wnqt6jHP07rGhLNgfbAsSONJZt
	v/sXt268XzCHszJfhDphQACV0Wi4UeIS2qnLutMqFCD+JgVYS9/MBu4xNBQp8EmRW2j3viPLumk
	qMGAgqW+mqg72r6Ve8Z0M5zjM=
X-Received: by 2002:a05:620a:44cc:b0:8c5:3415:acef with SMTP id af79cd13be357-8c6a678e79emr110003585a.55.1768511161691;
        Thu, 15 Jan 2026 13:06:01 -0800 (PST)
X-Received: by 2002:a05:620a:44cc:b0:8c5:3415:acef with SMTP id af79cd13be357-8c6a678e79emr109997185a.55.1768511161128;
        Thu, 15 Jan 2026 13:06:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:05:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com
Subject: Re: [PATCH v2 0/3] Enable mdss1 Display Port for Qualcomm lemans-ride platform
Date: Thu, 15 Jan 2026 23:05:56 +0200
Message-ID: <176851111168.3933955.1978286766565229688.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX9d2gr2mrfDmY
 AZ4WegjsnJdnnMZmNVIEEbx6P4r8oW9Hq6mbiFQVXfOG/98GI724tJgYmtFybSbdMAwUzCiTve9
 zugxKnYBQGdYH2mlSg4SJ7EhzwEOoNpbOMOg1/VQ2jcd45QHZR220om6Ir62HgvLLfBwq+pmxX5
 7/rgFCAdgMBNAsxBBjhcg7dK+fipWmDx1IRWfuMUbfG46+0hw+ASIpK6vyeIWrWSJ03CQ+/gxaT
 P+TAIFf6Cl0ZPwO+somiSCQX4RO3TPgiwpFDHKjaFniybS8eyJYsJlh8r6RCtwkqKg1uAMJUILW
 EtRA543jreNoO58fZSisFSx6ZLcxJf/McG616tsqlYyQxJaNysKPoLvAffSGUP2Ab0uUBdcxbej
 9uOjIIR+gZzhY5AUbfmsUWhDj66EDOZ1Dc2wIp64+pPSqyJtlspX1PJFte7y+HbBoEE1VMOhzns
 pXN4ubGIqXMr322TP7g==
X-Proofpoint-ORIG-GUID: F4J23c8BcDxzpk2a2yCASmdHGgXhoA7K
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=696956ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=aXzuBbYBWOr-X92n1-oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: F4J23c8BcDxzpk2a2yCASmdHGgXhoA7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150165

On Tue, 25 Nov 2025 16:26:19 +0530, Mani Chandana Ballary Kuntumalla wrote:
> This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
> on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
> lemans-ride platform.
> 

Applied to msm-next, thanks!

[1/3] drm/msm/dp: Update msm_dp_controller IDs for sa8775p
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1338e8ae4084

Best regards,
-- 
With best wishes
Dmitry



