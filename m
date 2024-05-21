Return-Path: <linux-arm-msm+bounces-20139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D3C8CB3A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 20:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D3C0B2095C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 18:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E481148FF0;
	Tue, 21 May 2024 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T3Gk4e3K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E044F14884F;
	Tue, 21 May 2024 18:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716316846; cv=none; b=ObzgBNLrbDZftBIdta5UjXQ0XElVLc9oXUDNxT4HSgsKfrntO2R81vrRveXc91zK4RaBATS+sRrHvomm8BsgUzsSTO+DkLz8AnPfNlgMWy/wpBmRMsm0d2Jb3RH3yiuj1cyrLX2C7QQ6PMhC4dA6XE3eJifhWrYAif3KwFLUQ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716316846; c=relaxed/simple;
	bh=KNChU/zTxeIANQKXeI/F7UaYoMhf0zs0ZKhrbCNbnxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bgAX3VYlh9owLAHvB2uCIHurnOTjoAbMfOm2aKYKY4ntNBPfQIl609M/WX1uooCeEJ1W0FzOTMap0sLQ9+MCxL0lvjGxAR0PXw/ByjPxVTbZf12/FCzaQQuwzrJrLKtWi2Qb6W0FjehNOdwb0D7SscYppBF86Qru0tyAnTWbo8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T3Gk4e3K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44L9xeRM004387;
	Tue, 21 May 2024 18:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=T5bkdynyzEdOYxsDcWGWLOmwsNAs+8sORtZJnwmIXto
	=; b=T3Gk4e3KMPegX3QRNTMViBKhX9eY9alLLW7mOuu35a1s9tEyp9obn+xowKL
	uNKE9UmbFEY+yeZJBksG8CZ40z0iaMjOSe2FppYbxcgF0QTH/eTsyZyCiicfJ445
	G+sdnIsYHMFKtY6dNtvIs+PHFd/CIr/5bBiGkqIVGkSgnCj0droReA0GgP9Hs0dn
	PbGZ81dIsC20qxs8vDQ8+jSNEtDex4uHUa3IUv0o0CR3Byuw+zHlfsfPlc5DCnCi
	Ufq404XRm5832TTAjoCZnSKlbpYPTILK74/aotM+ShhNqKfjj1oKke7Bp0w9ewus
	jEY3iUq4P4txtkjiIrI0M1EKn2Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqapmmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LIcUII016680
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:30 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 May 2024 11:38:29 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
Date: Tue, 21 May 2024 11:38:06 -0700
Subject: [PATCH RFC v3 9/9] tools: board-id: Add test suite
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240521-board-ids-v3-9-e6c71d05f4d2@quicinc.com>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
In-Reply-To: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: Amrit Anand <quic_amrianan@quicinc.com>,
        Peter Griffin
	<peter.griffin@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        "Andy
 Gross" <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Doug
 Anderson" <dianders@chromium.org>,
        Simon Glass <sjg@chromium.org>, "Chen-Yu
 Tsai" <wenst@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Humphreys,
 Jonathan" <j-humphreys@ti.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        "Jon
 Hunter" <jonathanh@nvidia.org>,
        Michal Simek <michal.simek@amd.com>,
        <boot-architecture@lists.linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Elliot Berman <quic_eberman@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ens5k3tAv93QYqUh2XVDuDq_VJmZVmkJ
X-Proofpoint-ORIG-GUID: Ens5k3tAv93QYqUh2XVDuDq_VJmZVmkJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_11,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405210140

Add a short test suite to demonstrate board-id selection and scoring.
This patch isn't intended to be merged here.

After compiling the kernel (esp. arch/arm64/boot/dts/qcom DTBs), run
tools/board-id/test.py.

The test cases provide a hypothetical firmware-provied board-id and
compares expected output for which DTBs gets matched.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 tools/board-id/test.py | 151 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/tools/board-id/test.py b/tools/board-id/test.py
new file mode 100644
index 000000000000..687b31ad73d2
--- /dev/null
+++ b/tools/board-id/test.py
@@ -0,0 +1,151 @@
+from collections import namedtuple
+import glob
+import os
+import subprocess
+from tempfile import NamedTemporaryFile
+import unittest
+
+
+LINUX_ROOT = os.path.abspath(os.path.join(__file__, "..", "..", ".."))
+ENV_WITH_DTC = {
+    "PATH": os.path.join(LINUX_ROOT, "scripts", "dtc") + os.pathsep + os.environ["PATH"]
+}
+
+
+TestCase = namedtuple("TestCase", ["score_all", "board_id", "output"])
+
+test_cases = [
+    TestCase(
+        # A board_id that could be provided by firmware
+        board_id="""
+        qcom,soc = <QCOM_ID_SM8650>;
+        qcom,soc-version = <QCOM_ID_SM8650 QCOM_SOC_REVISION(1)>;
+        qcom,platform = <QCOM_BOARD_ID_MTP>;
+        qcom,platform-type = <QCOM_BOARD_ID_MTP 0>;
+        qcom,platform-version = <QCOM_BOARD_ID_MTP 0 0x0100>;
+        qcom,boot-device = <QCOM_BOARD_BOOT_UFS>;
+        """,
+        score_all=False,
+        output="""
+        qcom/sm8650-mtp.dtb
+        """,
+    ),
+    TestCase(
+        # A board_id that could be provided by firmware
+        board_id="""
+        qcom,soc = <QCOM_ID_SM8550>;
+        qcom,soc-version = <QCOM_ID_SM8550 QCOM_SOC_REVISION(1)>;
+        qcom,platform = <QCOM_BOARD_ID_MTP>;
+        qcom,platform-type = <QCOM_BOARD_ID_MTP 0>;
+        qcom,platform-version = <QCOM_BOARD_ID_MTP 0 0x0100>;
+        qcom,boot-device = <QCOM_BOARD_BOOT_UFS>;
+        """,
+        score_all=True,
+        output="""
+        qcom/sm8550.dtb: 1
+        qcom/sm8550-mtp.dtb: 3
+        qcom/sm8550-mtp.dtbo: 2
+        """,
+    ),
+]
+
+
+def compile_board_id(board_id: str):
+    dts = f"""
+        /dts-v1/;
+
+        #include <dt-bindings/arm/qcom,ids.h>
+
+        / {{
+            compatible = "linux,dummy";
+            board-id {{
+                {board_id}
+            }};
+        }};
+        """
+    dts_processed = subprocess.run(
+        [
+            "gcc",
+            "-E",
+            "-nostdinc",
+            f"-I{os.path.join(LINUX_ROOT, 'scripts', 'dtc', 'include-prefixes')}",
+            "-undef",
+            "-D__DTS__",
+            "-x",
+            "assembler-with-cpp",
+            "-o" "-",
+            "-",
+        ],
+        stdout=subprocess.PIPE,
+        input=dts.encode("utf-8"),
+        check=True,
+    )
+    dtc = subprocess.run(
+        ["dtc", "-I", "dts", "-O", "dtb", "-o", "-", "-"],
+        stdout=subprocess.PIPE,
+        input=dts_processed.stdout,
+        env=ENV_WITH_DTC,
+    )
+    return dtc.stdout
+
+
+def select_boards(score_all, fwdtb):
+    with NamedTemporaryFile() as fwdtb_file:
+        fwdtb_file.write(fwdtb)
+        fwdtb_file.flush()
+        root_dir = os.path.join(LINUX_ROOT, "arch", "arm64", "boot", "dts")
+        return subprocess.run(
+            filter(
+                bool,
+                [
+                    "fdt-select-board",
+                    "-a" if score_all else None,
+                    "-r",
+                    fwdtb_file.name,
+                    *glob.glob(
+                        "qcom/*.dtb*",
+                        root_dir=root_dir,
+                    ),
+                ],
+            ),
+            stdout=subprocess.PIPE,
+            text=True,
+            cwd=root_dir,
+            env=ENV_WITH_DTC,
+            stderr=subprocess.STDOUT,
+        )
+
+
+def fixup_lines(s):
+    return '\n'.join(filter(bool, sorted(_s.strip() for _s in s.split('\n'))))
+
+
+class TestBoardIds(unittest.TestCase):
+    def __init__(self, index: int, args: TestCase) -> None:
+        super().__init__()
+        self.args = args
+        self.index = index
+
+    def runTest(self):
+        fwdtb = compile_board_id(self.args.board_id)
+        output = select_boards(self.args.score_all, fwdtb)
+        if output.stderr:
+            self.assertMultiLineEqual(output.stderr, "")
+        expected = fixup_lines(self.args.output)
+        actual = fixup_lines(output.stdout)
+        self.assertMultiLineEqual(expected, actual)
+
+    def __str__(self):
+        return f"Test case {self.index}"
+
+
+def suite():
+    suite = unittest.TestSuite()
+    for idx, test in enumerate(test_cases):
+        suite.addTest(TestBoardIds(idx + 1, test))
+    return suite
+
+
+if __name__ == "__main__":
+    runner = unittest.TextTestRunner()
+    runner.run(suite())

-- 
2.34.1


