Return-Path: <linux-arm-msm+bounces-78704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D67B4C053AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 11:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4B6D24E38B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 09:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFB6308F36;
	Fri, 24 Oct 2025 09:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IIPDBXJu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DAE308F07
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 09:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761296659; cv=none; b=k/bm8B4p8aEGbeLWMmf/EKmfj8WNUWUbdhwwIduCeqaVsVTr064Wbsl0BFg2+J9TczAakN87JdPQMylRJ++S9OQ16du8VyF+JZvWMX7nvCw000tLdhsJ+wZEJqLfSU7ImXNnoi4NO8hA7FadYlMDL5FWfDAMY9IDQnu7LcB58LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761296659; c=relaxed/simple;
	bh=g0gHpOAw3zIMj/1wPF3opcMcNJQ2q+c7c2Rj1F54Z2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9htbb95P7t35UpVbYhLckLxsZS6u3BK6xIDu8yVkSWbQCJoWJZfKvvhMQ1r+ZU7OU+KDS0fCEuchg9YxvI9JAHCY4AICu5oqUVLZMyIuWxE/+X9EQMSgI45CWCi9oQX0QLWsBkuWr2Jd+ePO5xr6J/knCYmTiQdoS9mwNNwpf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IIPDBXJu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FELS000374
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 09:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g0gHpOAw3zIMj/1wPF3opcMcNJQ2q+c7c2Rj1F54Z2o=; b=IIPDBXJuu4Wv4fTO
	BP0/CSW3yBaanAXa1ednNtDx193YunyIBOTP20xwJDrvYpfEVnRs8KRkyOsddfS6
	iPjv5ZgBFQKhxDAYe/knDFL4S2vx5eMxfpU3lLYEolUl9WIjTvgcey4iBHYz6Cqr
	PL6NXQdHKX9Tpcy4thmetomie/ra7ok2ckj9hS4g6stKsLilRJ8Unzpeoj7B9K1c
	V9YNoeNvO65iEcsRnZTq90Jas7nIZBHA+AyhJ5r+1ruDywoCvvmTfJhJBnsTcxIt
	yICX+/CC6H5gjaLlsI1zBVlmH//qMi73kUmhQNxDg3CVwR284C4ps9GJ6bd455s7
	+WOH1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49ym9j33ju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 09:04:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88f1dad9992so719422985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 02:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761296654; x=1761901454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0gHpOAw3zIMj/1wPF3opcMcNJQ2q+c7c2Rj1F54Z2o=;
        b=Ku89aTc86aR8TWY0tWrg54j5zQFTvhffOu5hPF/EUgLTPle9F/evNjhD2LO6aPgP4+
         PLu2gHId3ShRRKgEqUnkrZN1/fZGkcNLgYbMQwHln4G8ocZlx9gGkxrBPjC2s5T2nfhC
         ODJV6kPliZ9hEJTKFII7TaLJcTHyAPuU0Y9yBa3bEbG7XCakBBl5O17K1Ol8+a5uAvrP
         szKkz2yL39VWCrMYBZKIkOgb7Juz6rSU/Hp47pMrPGjCGtYLsUXxz9VVDh8nDGbgTTx6
         a5mQDbDQu43dUahObZKPq+D1vrT4pWiU+knD5aozfDguiw7TY7Bh2LAcr6HgNUFkMzVJ
         49mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOrz4CA2XpbGCHHPBcj40Oj5IbHCnXgwWfjmErqjODolm1vH6Q9e6AWBBuYXXyX3siOQ7tOpWQGm3ou/5D@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo/RELwk48WWmiHiJgHRwBmg9IMWBFtHpO0dABSh75ba0CLdTZ
	/JFh+FoeK6UvsCBXqSYAV/59cPMPELAaWaJArEApJlI9x/FLfWHfzhQUl7XOCV6U4H7EakTxkHN
	QSoRpq1vuDRVlmvm80oCW/gv57Cf3xwdvXqrWgGaS/2IRWipz+2RPFC2HX+eh+IRqbcBxVN1mAz
	r/ZvaJytadPD4Ytt1LajYHBcyjLN3DkjewuaoIQb0o0Q0=
X-Gm-Gg: ASbGncuMhaf2lvQ/9HPvgRpLzQCl1GqPsZD6Mj+W32mGkl8ezjA3LVSiG2IMm92rPhm
	t2jr+suq7hlL5HZ5oLam/CbcgVwWPS7ELZru06R/YeHsLStI5ALkJVaTXcxqvJH0cET+pZyiqPM
	ueI/fhOkxkMh/5mf88MSMPunWt/7SlYsCYidfi91mU/pQa+lT8nO71ZUGKcppzIdWSEdFPIGxqf
	0ZQMXJ/ag80mDSdSmVPln4RHnCyD/cWa/EyQ3LaZ0JulQ==
X-Received: by 2002:a05:620a:701b:b0:85d:3c32:c404 with SMTP id af79cd13be357-89070cd842cmr3029016185a.85.1761296653956;
        Fri, 24 Oct 2025 02:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcH7X9I3oq3A8xpwU4zFj0woURu/t1UEGWZ4WrgfA2Vy8Iz3Rekx75D5h0egBppJT6eu7llttNgC/cYYRxzYQ=
X-Received: by 2002:a05:620a:701b:b0:85d:3c32:c404 with SMTP id
 af79cd13be357-89070cd842cmr3029010485a.85.1761296653367; Fri, 24 Oct 2025
 02:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
 <20251023-add-support-for-camss-on-kaanapali-v3-1-02abc9a107bf@oss.qualcomm.com>
In-Reply-To: <20251023-add-support-for-camss-on-kaanapali-v3-1-02abc9a107bf@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 11:04:02 +0200
X-Gm-Features: AS18NWBkyZO4ADCwbuPSpZ8_0D23U3UYy4lbimK41M10tmzNwaNW7w3WqyAgoBI
Message-ID: <CAFEp6-06bubGxeNqf0rK7Oe3+YDS7f0_wHPCDTBnXmT7taw7Fw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali compatible
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=CLknnBrD c=1 sm=1 tr=0 ts=68fb410f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XIB30I8Fq4NfyXnsoAUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDExMiBTYWx0ZWRfX5zPibVQZgOOG
 rVbt4I4dMFVxsHmOfZa22dnePvmvl4e8jauWQpzWw4bvdjH+FWzF3dRIk3ha5TIiqmZzaAy6cRZ
 QGM0KId4DXETot59HwnBroY7KNw+KY/czcyF15CmqD4Mpvfi7pqE4O3n/Ypa/3hb6g5ecI2Bi+g
 cIdapiXXFoNQC0rwv1OKD4hZYtvzC3PnwVzrZdbSPYX+IPfJvzGwiM4/OKZIOZ0wYLUSFFbc17T
 gjS0usfecgP2++9K4NU9FmP8lJgtu1UpqWfISH2D3n4dbe9fN5JCTYtLqqhbX61IXD+lE5s6zma
 qgz9Lpwa0pfHwoO/d2D+BvF1/yIOPX84lRgGcyzhm9p0ntUQImPI4XIRCgTv9jkPg30sU+2U6CE
 CHAFeSiQ97XO3OP0SO9B3GeyTcetWA==
X-Proofpoint-GUID: Fuu-gSrROuuOVgLo0jiQ-semI0VRsc3-
X-Proofpoint-ORIG-GUID: Fuu-gSrROuuOVgLo0jiQ-semI0VRsc3-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230112

On Thu, Oct 23, 2025 at 11:14=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Add Kaanapali compatible consistent with CAMSS CCI interfaces.
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

