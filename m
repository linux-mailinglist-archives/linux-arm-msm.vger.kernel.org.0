Return-Path: <linux-arm-msm+bounces-93369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CR7AyjwlmngrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 12:12:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A09AD15E32A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 12:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3A223021E68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 11:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C205433DEC7;
	Thu, 19 Feb 2026 11:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aqpv5oaU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLUp4zej"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AE3285060
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 11:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771499522; cv=none; b=NLY88mgB1khL2NVwY6qEbE2WLQkfJYsnKsAEtPn6pyURywxWHyXuv3PoVCE5yNj1+Cd7anax6ojULgzWfqfgbfyqHsyRIAKBbewK7zldvU7IxCy7uhorqKKWRJJei/f1yQlNDvjr/Y+zN5UB02xrYDG0nkqW745LpKzKWYPk5/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771499522; c=relaxed/simple;
	bh=zbxY9b0ZlCq0UrOIJd6sjF+e77WKY8qgVD84bS+Ct8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ub21OA6MCtlg5U938bv+Sz6CU3s8DxPj+oU+KIX8fWsCfWjtXd/17Tr4WVa9mvxl94J4MMeyPL1zzEVN3iTrU5aEV1wS2uk/yIsLiXInr/HxKb7Bs3e6qt8+oTTat9BrgUO8MSCoMtAsVG+diZt2EUQigBI0qmgLECJ7LiuU1FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aqpv5oaU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLUp4zej; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IMGCl92148431
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 11:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vOvNdYCVSmVkwGXEsNxSmL
	jxoujgZy923FLHo8wDNN8=; b=Aqpv5oaUyjdHA8YT96METkbU8yj35aopI7zRw6
	jBkftnIdd1qZnD2+IlgvxoDfcA1BPPcuyCHVfIz/WIRaXP+s0uECHK380CWhy0Z9
	Rx542b8z54/9SbbNEqO1pQqegi0owcFVoUXfB7W+a2nFwWqNP0HtYs4DF+02FdUB
	J3DDy99883M9ebjyJ76dEgjTVcep+rG+y6fFaqYlsELBn//ztKHH2mM6TP2clCrq
	DBNAKB94Y9WxcFmllRnZUrgcRH3vbId7u9EAiSwF0L0oizA4NR4NL3MOAjurxzSs
	8Q+nm35AFNS5DDlOUkIeibl3wezeD/r6a3ZvIvncrZjzUiYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdn1qhpeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 11:11:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4817f3c8so517180185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 03:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771499518; x=1772104318; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vOvNdYCVSmVkwGXEsNxSmLjxoujgZy923FLHo8wDNN8=;
        b=gLUp4zejRezD0YTma+WrTJ0DGOE79B9RITnuVyat3c91bPpwaYLJqsRilwCPpATm8k
         nbNpxGrA7Tg4DOW+I6rq8GJ+Yt6NwjUYXnCpwLS9y0AkImMZI6hRU5OXmaXaUgkYQz+q
         r04vgoX/NKCvZOJuKqzjz955JhaYguqD6WYmkvKtEjFnDKjmzpE4+/4B7lkNXE6xwzLJ
         vqTHbiBtmRclMSGh54cEd5hOukbayAACORuMIF4/I1uVOyxu2j7feHezVGsLgN5atuX/
         EAqXZzPqlOmMI+/WQtvbIK6aaNA2pLohc5xfVn7yM0OjGaj7sdnUslH79ValoEQRzEgc
         qdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771499518; x=1772104318;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOvNdYCVSmVkwGXEsNxSmLjxoujgZy923FLHo8wDNN8=;
        b=pRQ93XuQQ08Z3BdY0YPIKN1Ed4wIV0AKukAdA33F9r9r4tz5ZfVLEJUwRQ10VqknhN
         y/apE3+jpEJ+sZNtosRrqeLBpqkBVpVttYkauFd6WTdomBY73xPfVQIIWTvV5u322Dbk
         mFkFHinYPjvF3eXV2aPOZs+1rsnPJDQVGfW1IIPDdhRWyUlO4yCxu4e4iJXZVDeJ7UEg
         LzReK8+MlmQ0JOQseJwOzGibfrPNY8MqYP5O2WK1zzvC8C0lGKmJi/0/2LmcMHPIm4qx
         F3n7yydoHmkd6Pmluldb3uS08valZ9Ghv5PEuchb9njIhxg/3m0QJaywttY+mmCTAAdF
         tezg==
X-Forwarded-Encrypted: i=1; AJvYcCUmWz3fscrO3sp6VT2qimYuLLgGuCymDhpdJAXEsLWZZ5pFm2XNrCLUFHA+10h+Fz0xaqmICNuXYWtk+RV8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa/tLIa3rsGYYp3Mxr6mv55VXv9Xs4w29GrdxrbAeQeHUebSs9
	l3pXeBIIQWsdYS8cKJiWJiuf3yCMQ+PbbITisvc8N4wQhKkhFDXsrsln7qZ2p9Ht6J0ibeR75mQ
	abNJxhfKb3TqXCG2ujVhTP485tnvY6hquGpVZqeje2iK3jGSOacdZzzstzllyGJrdnuJb
X-Gm-Gg: AZuq6aKxnUKWgzVpCf5tGCbTqOiuikIZC1a1jfRPigJ6UKZor1b/uYT0wWdHlwZkOba
	+J8PfmSV8yZao1HCrLcfcmeIeP+NuabxH978Fr9NjRhf7/UjpDVGVGlRShGfZc4bjd/oTqqPq+D
	oEJUDHn6M+6EvBjhZBJryLtFIVLxpMM498xVVmKZ9nt5v6/FTCKHPE+/7iBrR4/+7i+UlSzlC/a
	BGOk+RxKxkiQ86BhEtNTRXNMUUScFn12jcyAwVzuC/AnGYWoY0rhqKsuMihw8BLIDzyfUUAPRcu
	fFrstzHZkpuBPbN24QXuqkKZQ8r61lw6FtsJBQNOWVHAUZ5JatUSsj0aLqZd0V3qgY7XbAHxQqW
	Xtqd6Ez2Ahe/VyxhE7CJ/GNs0p+yubA==
X-Received: by 2002:a05:620a:8bc1:b0:8cb:47b4:165f with SMTP id af79cd13be357-8cb47b4235amr1650125285a.14.1771499518411;
        Thu, 19 Feb 2026 03:11:58 -0800 (PST)
X-Received: by 2002:a05:620a:8bc1:b0:8cb:47b4:165f with SMTP id af79cd13be357-8cb47b4235amr1650122485a.14.1771499517898;
        Thu, 19 Feb 2026 03:11:57 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d92267bsm1003935615e9.0.2026.02.19.03.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:11:57 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 13:11:48 +0200
Subject: [PATCH] phy: qcom: qmp-ufs: Fix SM8650 PCS table for Gear 4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-phy-qcom-qmp-ufs-fix-sm8650-pcs-g4-table-v1-1-f136505b57f6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPPvlmkC/yXNywqDMBCF4VeRWXcgCVW0r1K6yGWiKY3GjBZFf
 Pem7fKDw38OYMqBGG7VAZnegcM0FshLBXbQY08YXDEooRqhZIdp2HG2U8Q5Jlw9ow8bcmybWmC
 yjP0VF21ehJ2T2nlZi9YbKLmUqUx/V/fH37yaJ9nl24fz/AAhDg4CjAAAAA==
X-Change-ID: 20260219-phy-qcom-qmp-ufs-fix-sm8650-pcs-g4-table-9d1adf1508fb
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2491;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zbxY9b0ZlCq0UrOIJd6sjF+e77WKY8qgVD84bS+Ct8g=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBplu/2nLEANE/+RGxkee6qF82zBRu6o+t4/dBv9
 RHpgPiujVWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZbv9gAKCRAbX0TJAJUV
 VikkD/9vK/KxNfCrXsqpjHZTVapOxrnG7w0vh7H64jya46zwEV8JS2fwNSqFZf8Xr4ulsRCeHcU
 7Ij8VIKnDJmf22Pggu+h2avvL56D6hm1c5r1IJl9Hqy33Qq+uMORKJKMTJbyBb18gfrGmz+7oTh
 IAt/IQfK7TfVERp1KX92Q1vt0C58d0+icEYiQyYA1qsXuodRTY5zlwzUUmhAtvehLGdAkq8Ydo1
 zGQ0bfxLTQ5A13k3+ahnMmOtpZdCXGnzRBaBVULQnoILyXz/1jFYOMyneBviuSN9HHgjllKR2ek
 yZ+Kej6CvnU4hnLohsgpDp5ujsinjsnZlnPHi3/lbYXrqFUDmaTDKb543ktDEM5dyNNdbQVDR/+
 GCbWDc+/eITAkGO4nm74mhjl6NZcCNJRjOZjCQ2Dak9KazU6+mGjbfj25XAzdnrtZSE91w1w676
 FGq5a03pDVnaGQ5IzyovPVn7h8uU2g2iKRvYvMBuY3gz7mVxGH0oMbkxdZi9Ebrqry5LYnVYaF2
 DDnUM2cXdT1aCehliJJJvlygkAbEKXOYiT1pchk1XYI6qN36lc03vYNf5cpMM5CqnKZPO1aKyaP
 YUZZiML8f4ct+7ci6nkvQs5Kr/4oxILREuGC+U/J4q3wl6s/UZeflPzX8H0UK2IwNkfeymPDpw9
 D91A7D4UkxxAS/A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: VZaw3ymDC4xWlBjetVaQk3QxzSFocXtJ
X-Proofpoint-GUID: VZaw3ymDC4xWlBjetVaQk3QxzSFocXtJ
X-Authority-Analysis: v=2.4 cv=c7umgB9l c=1 sm=1 tr=0 ts=6996efff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iZjorvmLyqBVRiOuJXwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEwMiBTYWx0ZWRfX1DA5SU6aFVVm
 oH3ADh9PKbnsBWquuEEL/QUpqiePo0WVhw664lnWfss7nYEYLwbfnHauVxmF67s/u26dBseceIt
 y7cWZQNRJf72fofKlPkPBu5fSMViwkHSClp8tKY0Llzxg3iKy6SoSRtTgHWumnO+9OBcO/V/y6o
 5DVWUJD0fI/ZWXnwewufJQyfRmjSBqF70yEC+yVQWVy6bCG7bzWndz5ozrTfhMEqojGDc9oSUal
 gPtACqQqSE6xWT7RG0sMFO76LT2k53yDpC49Zq7PpfjUKWnWiQraZPYEx5JD/6oLvOrY1qRksRh
 Ib6lT+EPM5ZDX90y37RxrPGVz9UXV+cR1sfwb8V0DMlk5sXoO6OfwZv6qSi1pPW2gVX2BQy8ZFT
 Sm2HVEJ392KTc2wBT3IV8lqBZbUbIt71tBIhA3nHpx30LqHxr53n/EZYZ/B09kozeNJRcYXAkaO
 2y/AfWZc8HbcBg4izCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93369-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A09AD15E32A
X-Rspamd-Action: no action

According to internal documentation, on SM8650, when the PHY is configured
in Gear 4, the QPHY_V6_PCS_UFS_PLL_CNTL register needs to have the same
value as for Gear 5.

At the moment, there is no board that comes with a UFS 3.x device, so
this issue doesn't show up, but with the new Eliza SoC, which uses the
same init sequence as SM8650, on the MTP board, the link startup fails
with the current Gear 4 PCS table.

So fix that by moving the entry into the PCS generic table instead,
while keeping the value from Gear 5 configuration.

Cc: stable@vger.kernel.org # v6.10
Fixes: b9251e64a96f ("phy: qcom: qmp-ufs: update SM8650 tables for Gear 4 & 5")
Suggested-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index df138a5442eb..771bc7c2ab50 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -990,6 +990,7 @@ static const struct qmp_phy_init_tbl sm8650_ufsphy_pcs[] = {
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_PCS_CTRL1, 0xc1),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_PLL_CNTL, 0x33),
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0f),
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_SIGDET_CTRL2, 0x68),
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_POST_EMP_LVL_S4, 0x0e),
@@ -999,13 +1000,11 @@ static const struct qmp_phy_init_tbl sm8650_ufsphy_pcs[] = {
 };
 
 static const struct qmp_phy_init_tbl sm8650_ufsphy_g4_pcs[] = {
-	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_PLL_CNTL, 0x13),
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x04),
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x04),
 };
 
 static const struct qmp_phy_init_tbl sm8650_ufsphy_g5_pcs[] = {
-	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_PLL_CNTL, 0x33),
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x05),
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x05),
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_HS_G5_SYNC_LENGTH_CAPABILITY, 0x4d),

---
base-commit: 50f68cc7be0a2cbf54d8f6aaf17df32fb01acc3f
change-id: 20260219-phy-qcom-qmp-ufs-fix-sm8650-pcs-g4-table-9d1adf1508fb

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


